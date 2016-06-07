import core.models

def topics(request):
    parent_topics = core.models.TeachTopic.objects.filter(parent__isnull=True).prefetch_related('teachtopic_set', 'teachitem_set').order_by('order_index')
    return dict(topics=parent_topics)


