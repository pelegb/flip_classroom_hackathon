from django.conf.urls import patterns, url

from fc_user import views
from django.core.urlresolvers import reverse

urlpatterns = patterns('',
    #url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    #url(r'^videos/(?P<video_id>\d+)/$', views.video_detail, name='video_detail'),
    url(r'^login/$', 'django.contrib.auth.views.login',kwargs=dict(template_name = 'fc_user/login.html'),name="login"),
    url(r'^logout/$', 'django.contrib.auth.views.logout',name="logout",kwargs=dict(next_page='/common/home/')),
    url(r'^register/$', views.register,name="register"),
    url(r'^trans/$', views.trans,name="trans")       
)
#{'next_page' : reverse('common:home')}


