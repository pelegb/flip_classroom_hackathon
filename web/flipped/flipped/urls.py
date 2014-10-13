from django.conf import settings
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.views.generic.base import RedirectView

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'flipped.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$', RedirectView.as_view(url='/common/home/')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^core/', include('core.urls', namespace="core")),
    url(r'^fc_user/', include('fc_user.urls', namespace="fc_user")),
    url(r'^common/', include('common.urls', namespace="common"))
)


if settings.DEBUG:
    import debug_toolbar
    urlpatterns += patterns('',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
