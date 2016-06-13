from django.shortcuts import render
import core.models


def home(request):
    parent_topics = core.models.TeachTopic.objects.root_topics(for_teacher=False) \
        .prefetch_related('teachtopic_set', 'teachitem_set').order_by('order_index')
    feed = core.models.VideoPage.objects.order_by('-upload_date')[:6]
    return render(request, 'common/home.html', {'topics': parent_topics, 'feed': feed})


def about_us(request):
    return render(request, 'common/about_us.html')


def help(request):
    return render(request, 'common/help.html')


def teacher(request):
    parent_topics = core.models.TeachTopic.objects.root_topics(for_teacher=True) \
        .prefetch_related('teachtopic_set', 'teachitem_set').order_by('order_index')
    return render(request, 'common/teacher.html', {'topics': parent_topics})
