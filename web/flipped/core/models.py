from django.db import models
from django.db.models.aggregates import Avg, Count
import django.contrib.auth
import sys


class TeachEntity(models.Model):
    class Meta:
        abstract = True
    title = models.CharField(max_length=50)
    description = models.TextField()
    parent = models.ForeignKey('TeachTopic', blank=True,null=True)
    order_index = models.PositiveIntegerField(default=sys.maxint)
    
    def __unicode__(self):
        return self.title


class TeachTopic(TeachEntity):
    def item_count(self):
        if not self.teachtopic_set.count():
            return self.teachitem_set.count()

        return sum(child_topic.item_count() for child_topic in self.teachtopic_set.all()) + self.teachitem_set.count()


class TeachItem(TeachEntity):
    pass


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
    
    
    
        
    

