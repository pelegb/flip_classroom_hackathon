import core.models

def topics(request):
    parent_topics = core.models.TeachTopic.objects.filter(parent__isnull=True)
    return dict(topics=parent_topics)


