import core.models

def topics(request):
    parent_topics = core.models.TeachTopic.objects.filter(parent__isnull=True).order_by('order_index')
    return dict(topics=parent_topics)


