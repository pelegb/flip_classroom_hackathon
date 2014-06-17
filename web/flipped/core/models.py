from django.db import models
from django.db.models.aggregates import Avg, Count
import django.contrib.auth
import sys


class TeachEntity(models.Model):
    class Meta:
        abstract = True

    title = models.CharField(max_length=50)
    description = models.TextField()
    parent = models.ForeignKey('TeachTopic', blank=True, null=True)
    order_index = models.PositiveIntegerField(default=sys.maxint)

    video_count_cache = models.PositiveIntegerField(null=True, default=None)

    def purge_video_count(self):
        """Recursively(up) purge the video count cache"""
        self.video_count_cache = None
        self.save()
        if self.parent:
            self.parent.purge_video_count()

    def __unicode__(self):
        return self.title


class TeachItem(TeachEntity):
    def video_count(self):
        """Count and cache video count"""
        if not self.video_count_cache:
            self.video_count_cache = self.videopage_set.count()
            self.save()

        return self.video_count_cache


class TeachTopic(TeachEntity):
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
    
    youtube_movie_id = models.CharField(max_length=25)
    upload_date      = models.DateTimeField('date uploaded to our site',auto_now_add=True)
    content          = models.TextField()
    video_title      = models.CharField(max_length=VIDEO_TITLE_LENGTH)
    user             = models.ForeignKey(django.contrib.auth.get_user_model())
    teach_item       = models.ForeignKey(TeachItem, blank=True, null=True)
    tags             = models.ManyToManyField('Tag',related_name='videos',blank=True,null=True)
    
    def __unicode__(self):
        return self.video_title
    
    def _fetch_rating(self, context):
        rating = RatingReview.objects.filter(video__id=self.id, context=context).aggregate(count=Count('rate'),average=Avg('rate'))
        rating['average'] = int(round(rating['average'])) if rating['average'] else 0
        return rating
    
    def relevancy_rating(self):
        return self._fetch_rating(RatingReview.context_choices[0][0])

    def quality_rating(self):
        return self._fetch_rating(RatingReview.context_choices[1][0]) 


class Review(models.Model):
    class Meta:
        abstract=True
    video   = models.ForeignKey(VideoPage)
    user = models.ForeignKey(django.contrib.auth.get_user_model(), blank=True, null=True, default=None)


class RatingReview(Review):
    context_choices = (
        ("rel",      "Relevancy"),
        ("quality",  "Technical quality"),
    )
    context = models.CharField(max_length=12, choices=context_choices)
    rate    = models.PositiveSmallIntegerField()


class TextualReview(Review):
    textual_review  = models.CharField(max_length=500)


class Tag(models.Model):
    name = models.CharField(max_length=20,unique=True)
    def get_video_count(self):
        return self.videos.count()
    def __unicode__(self):
        return self.name
    
    
    
        
    

