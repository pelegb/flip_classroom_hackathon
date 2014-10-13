from django.shortcuts import render
import core.models


def home(request):
    feed = core.models.VideoPage.objects.order_by('-upload_date')[:5]
    return render(request, 'common/home.html', {'feed': feed})
