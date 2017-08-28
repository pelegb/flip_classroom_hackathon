from django.conf.global_settings import AUTH_USER_MODEL
from django.db import models
from django.db.models.aggregates import Avg, Count
from django.db.models.signals import pre_delete, pre_save
from django.dispatch import receiver
from django.utils.translation import ugettext_lazy as _


class TeachEntity(models.Model):
    class Meta:
        abstract = True

    title = models.CharField(max_length=50)
    description = models.TextField()
    parent = models.ForeignKey('TeachTopic', blank=True, null=True)
    order_index = models.PositiveIntegerField(default=2147483647)

    video_count_cache = models.PositiveIntegerField(null=True, default=None)

    def purge_video_count(self):
        """Recursively(up) purge the video count cache"""
        self.video_count_cache = None
        self.save()
        if self.parent:
            self.parent.purge_video_count()

    def get_ancestry(self):
        """return ancestor list sorted from outer to inner, not including self"""
        entity = self
        ancestors = []
        while entity:
            ancestors.insert(0, entity)
            entity = entity.parent
        return ancestors

    def __unicode__(self):
        return self.title


class TeachItem(TeachEntity):
    entity_type = "item"

    def video_count(self):
        """Count and cache video count"""
        if not self.video_count_cache:
            self.video_count_cache = self.videopage_set.count()
            self.save()

        return self.video_count_cache

    def children(self):
        return self.videopage_set.all()


class TeachTopicManger(models.Manager):
    def root_topics(self, for_teacher=False):
        return self.filter(parent__isnull=True, for_teacher=for_teacher)


class TeachTopic(TeachEntity):
    objects = TeachTopicManger()
    entity_type = "topic"

    for_teacher = models.BooleanField(default=False)

    def children(self):
        return sorted(list(self.teachitem_set.all()) + list(self.teachtopic_set.all()), key=lambda x: x.order_index)

    def get_subtree(self):
        child_entities = sorted(list(self.teachitem_set.all()) + list(self.teachtopic_set.all()),
                                key=lambda x: x.order_index)

        subtree = []
        for child in child_entities:
            subtree.append(child)
            if child.entity_type == 'topic':
                subtree.extend(child.get_subtree())

        return subtree

    def video_count(self):
        """Recursively(down) count and cache video count"""
        if not self.video_count_cache:
            own_videos = sum(item.video_count() for item in self.teachitem_set.all())
            child_topic_videos = sum(child_topic.video_count() for child_topic in self.teachtopic_set.all())
            self.video_count_cache = own_videos + child_topic_videos
            self.save()

        return self.video_count_cache


class VideoPage(models.Model):
    VIDEO_TITLE_LENGTH = 50
    VIDEO_DESCRIPTION_LENGTH = 512
    LESSON = 'LESSON'
    DEMONSTRATION = 'DEMONSTRATION'
    EXPERIMENT = 'EXPERIMENT'
    PROBLEM_SOLVING = 'PROBLEM_SOLVING'
    ADVANCED = 'ADVANCED'
    OTHER = 'OTHER'
    CATEGORY_VALUES = (LESSON, DEMONSTRATION, EXPERIMENT, PROBLEM_SOLVING, ADVANCED, OTHER)
    CATEGORY_CHOICES = [(category, _(category)) for category in CATEGORY_VALUES]
    CATEGORY_DESCRIPTION_CHOICES = [(category, _(category + '_description')) for category in CATEGORY_VALUES]

    youtube_movie_id = models.CharField(max_length=25)
    youtube_channel = models.CharField(max_length=200)
    upload_date = models.DateTimeField('date uploaded to our site', auto_now_add=True)
    content = models.TextField()

    video_title = models.CharField(max_length=VIDEO_TITLE_LENGTH)
    video_description = models.CharField(max_length=VIDEO_DESCRIPTION_LENGTH, null=True)
    video_upload_date = models.DateTimeField('date uploaded to Youtube', null=True)
    video_duration = models.CharField(max_length=20, null=True)

    user = models.ForeignKey(AUTH_USER_MODEL)
    teach_item = models.ForeignKey(TeachItem, blank=True, null=True)
    tags = models.ManyToManyField('Tag', related_name='videos', blank=True, null=True)
    category = models.CharField(max_length=40, choices=CATEGORY_CHOICES, default=LESSON)

    def __unicode__(self):
        return self.video_title

    def delete(self, *args, **kwargs):
        teach_item_id = self.teach_item.id
        super(VideoPage, self).delete(*args, **kwargs)
        TeachItem.objects.filter(id=teach_item_id)[0].purge_video_count()

    def _fetch_rating(self, context):
        rating = RatingReview.objects.filter(video__id=self.id, context=context).aggregate(count=Count('rate'),
                                                                                           average=Avg('rate'))
        rating['average'] = int(round(rating['average'])) if rating['average'] else 0
        return rating

    def relevancy_rating(self):
        return self._fetch_rating(RatingReview.context_choices[0][0])

    def quality_rating(self):
        return self._fetch_rating(RatingReview.context_choices[1][0])


class CandidateVideoPage(models.Model):
    VIDEO_TITLE_LENGTH = 50
    VIDEO_DESCRIPTION_LENGTH = 512
    RELATED_VIDEO = 'related_video'
    REASONS = (RELATED_VIDEO,)
    STATE_CANDIDATE = 'candidate'
    STATE_PROMOTED = 'promoted'
    STATES = (STATE_CANDIDATE, STATE_PROMOTED, 'irrelevant', 'review later')

    youtube_movie_id = models.CharField(max_length=25, unique=True)
    youtube_channel = models.CharField(max_length=200)

    video_title = models.CharField(max_length=VIDEO_TITLE_LENGTH)
    video_description = models.CharField(max_length=VIDEO_DESCRIPTION_LENGTH, null=True)
    video_upload_date = models.DateTimeField('date uploaded to Youtube', null=True)
    video_duration = models.CharField(max_length=20, null=True)
    video_subtitles = models.CharField(max_length=256, null=True)

    candidate_reason = models.CharField(max_length=40, choices=[(x, x) for x in REASONS], default=RELATED_VIDEO)

    related_video_page = models.ForeignKey(VideoPage, blank=True, null=True, related_name='candidate_videos')
    video_page = models.OneToOneField(VideoPage, blank=True, null=True)

    state = models.CharField(max_length=40, choices=[(x, x) for x in STATES], default=STATE_CANDIDATE)

    def __unicode__(self):
        return self.video_title

    def hebrew(self):
        return any(u"\u0590" <= c <= u"\u05EA" for c in self.video_title) or \
               any(u"\u0590" <= c <= u"\u05EA" for c in self.video_description)

    hebrew.boolean = True

    def hebrew_subtitles(self):
        return bool(self.video_subtitles) and ('he' in self.video_subtitles or 'iw' in self.video_subtitles)

    hebrew_subtitles.boolean = True


class Review(models.Model):
    class Meta:
        abstract = True

    video = models.ForeignKey(VideoPage)
    user = models.ForeignKey(AUTH_USER_MODEL, blank=True, null=True, default=None)


class RatingReview(Review):
    context_choices = (
        ("rel", "Relevancy"),
        ("quality", "Technical quality"),
    )
    context = models.CharField(max_length=12, choices=context_choices)
    rate = models.PositiveSmallIntegerField()


class TextualReview(Review):
    textual_review = models.CharField(max_length=500)


class Tag(models.Model):
    name = models.CharField(max_length=20, unique=True)

    def get_video_count(self):
        return self.videos.count()

    def __unicode__(self):
        return self.name


class TopicSuggestion(models.Model):
    user = models.ForeignKey(AUTH_USER_MODEL, blank=True, null=True, default=None)
    email = models.EmailField(max_length=254, blank=True, null=True, default=None)
    title = models.CharField(max_length=50, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    parent_topic = models.ForeignKey('TeachTopic', blank=True, null=True)
    youtube_url = models.CharField(max_length=50, blank=True, null=True)


@receiver(pre_delete, sender=VideoPage, dispatch_uid='purge_video_count_on_video_deletion')
def purge_video_count_on_video_deletion(sender, instance, using, **kwargs):
    instance.teach_item.purge_video_count()


@receiver(pre_delete, sender=TeachEntity, dispatch_uid='purge_video_count_on_teach_entity_deletion')
def purge_video_count_on_teach_entity_deletion(sender, instance, using, **kwargs):
    instance.purge_video_count()


@receiver(pre_save, sender=VideoPage, dispatch_uid='purge_video_count_on_video_relation_update')
def purge_video_count_on_video_relation_update(sender, instance, raw, using, update_fields, **kwargs):
    if update_fields and len({'teach_item', 'teach_item_id'} & update_fields) > 0:
        instance.teach_item.purge_video_count()


@receiver(pre_save, sender=TeachEntity, dispatch_uid='purge_video_count_on_teach_entity_relation_update')
def purge_video_count_on_teach_entity_relation_update(sender, instance, raw, using, update_fields, **kwargs):
    if update_fields and len({'parent', 'parent_id'} & update_fields) > 0:
        instance.parent.purge_video_count()
