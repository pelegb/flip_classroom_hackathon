from core.models import TeachTopic
from django.core.urlresolvers import reverse


def get_jstree_data(subtree, topic_id, opened=True, enable_items_only=False, include_video_count=True):
    tree_data = [{'id': entity.entity_type + str(entity.id),
                  'parent': '#' if topic_id == entity.parent_id else TeachTopic.entity_type + str(entity.parent_id),
                  'text': u'%s (%s)' % (unicode(entity), entity.video_count()) if include_video_count else unicode(entity),
                  'a_attr': {'href': reverse('core:topic_view' if entity.entity_type == 'topic' else 'core:item_view', args=(entity.id,))},
                  'state': {'opened': opened,
                            'disabled': enable_items_only if entity.entity_type == 'topic' else False}}
                 for entity in subtree]
    return tree_data
