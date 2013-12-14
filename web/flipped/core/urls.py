from django.conf.urls import patterns, url

from core import views

urlpatterns = patterns('',
    #url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    url(r'^videos/(?P<video_id>\d+)/$', views.video_detail, name='video_detail'),
    url(r'^add-video/',views.add_video,name='add_video'),
    url(r'^topic/(?P<topic_id>\d+)/$', views.topic_view, name='topic_view'),
    url(r'^item/(?P<item_id>\d+)/$', views.item_view, name='item_view') 
)
