from django.conf.urls import patterns, url
from django.core.urlresolvers import reverse
from fc_user import views

urlpatterns = patterns('',
    #url(r'^$', views.index, name='index'),
    # ex: /polls/5/
    #url(r'^videos/(?P<video_id>\d+)/$', views.video_detail, name='video_detail'),
    url(r'^login/$', 'django.contrib.auth.views.login',kwargs=dict(template_name = 'fc_user/login.html'),name="login"),
    url(r'^logout/$', 'django.contrib.auth.views.logout',name="logout",kwargs=dict(next_page='/common/home/')),
    url(r'^register/$', views.register,name="register"),
    url(r'^password/change/$', 'django.contrib.auth.views.password_change',
        {'template_name': 'fc_user/password_change.html',
         'post_change_redirect': '/fc_user/password/change/done/'},
        name="password_change"),
    url(r'^password/change/done/$', 'django.contrib.auth.views.password_change_done',
    {'template_name': 'fc_user/password_change_done.html'},
    name="password_change_done"),
)
#{'next_page' : reverse('common:home')}


