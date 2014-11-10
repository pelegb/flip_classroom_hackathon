from django.core.urlresolvers import reverse


def get_jstree_data(subtree, topic_id):
    tree_data = [{'id': entity.id,
                  'parent': '#' if topic_id == entity.parent_id else entity.parent_id,
                  'text': u'%s (%s)' % (unicode(entity), entity.video_count()),
                  'a_attr': {'href': reverse('core:topic_view' if entity.entity_type == 'topic' else 'core:item_view', args=(entity.id,))},
                  'state': {'opened': True}} for entity in subtree]
    return tree_data
