from django.db import models

class VideoPage(models.Model):
    youtube_link = models.URLField()
    upload_date  = models.DateTimeField('date uploaded to our site')
    content      = models.TextField()
    video_title  = models.CharField(max_length=50)

    def __unicode__(self):
        return self.video_title

class Review(models.Model):
    class Meta:
        abstract=True
    video   = models.ForeignKey(VideoPage)
    
class RatingReview(Review):
    context_choices = (
        ("rel",      "Relevancy"),
        ("quality",  "Technical quality")
    )
    context = models.CharField(max_length=10)
    rate    = models.PositiveSmallIntegerField()

class TextualReview(Review):
    textual_review  = models.CharField(max_length=500)
