from django.conf.urls import patterns, url
from fc_user import views, forms

urlpatterns = patterns('',
                       url(r'^$', views.register, name="register"),
                       url(r'^login/$', 'django.contrib.auth.views.login',
                           kwargs=dict(template_name='fc_user/login.html',
                                       authentication_form=forms.AuthenticationForm), name="login"),
                       url(r'^logout/$', 'django.contrib.auth.views.logout', name="logout",
                           kwargs=dict(next_page='/common/home/')),
                       url(r'^$', views.register, name="register"),
                       url(r'^password/change/$', 'django.contrib.auth.views.password_change',
                           {'template_name': 'fc_user/password_change.html',
                            'post_change_redirect': '/fc_user/password/change/done/'},
                           name="password_change"),
                       url(r'^password/change/done/$', 'django.contrib.auth.views.password_change_done',
                           {'template_name': 'fc_user/password_change_done.html'},
                           name="password_change_done"),
                       )
