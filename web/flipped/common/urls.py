from django.conf.urls import url

from common import views

urlpatterns = [
    # url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    url(r'^home/$', views.home, name='home'),
    url(r'^about_us/$', views.about_us, name='about_us'),
    url(r'^help/$', views.help, name='help'),
    url(r'^teacher/$', views.teacher, name='teacher'),
    url(r'^syllabus/$', views.syllabus, name='syllabus')
]
