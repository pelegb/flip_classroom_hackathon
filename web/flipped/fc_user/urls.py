from django.conf.urls import patterns, url

from core import views

urlpatterns = patterns('',
    #url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    #url(r'^videos/(?P<video_id>\d+)/$', views.video_detail, name='video_detail'),
)

