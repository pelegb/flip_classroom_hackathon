from django import template
from django.core.urlresolvers import reverse

from core.models import TeachTopic

register = template.Library()

@register.filter(name="teach_entity_url")
def teach_entity_url(teach_entity):
    if teach_entity.entity_type == TeachTopic.entity_type:
        return reverse('core:topic_view', args=[teach_entity.id])
    else:
        return reverse('core:item_view', args=[teach_entity.id])