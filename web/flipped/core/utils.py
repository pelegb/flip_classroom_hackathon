from django.core.urlresolvers import reverse

from core.models import TeachTopic


def get_jstree_data(subtree, topic_id, opened=True, enable_items_only=False, include_video_count=True, selected_item_id=None):
    tree_data = [{'id': entity.entity_type + str(entity.id),
                  'parent': '#' if topic_id == entity.parent_id else TeachTopic.entity_type + str(entity.parent_id),
                  'text': u'%s (%s)' % (unicode(entity), entity.video_count()) if include_video_count else unicode(
                      entity),
                  'a_attr': {'href': reverse_teach_entity(entity)},
                  'state': {'opened': opened,
                            'disabled': enable_items_only if entity.entity_type == 'topic' else False,
                            'selected': True if selected_item_id and entity.id == selected_item_id and entity.entity_type == 'item' else False},
                  'real_id': entity.id}
                 for entity in subtree]
    return tree_data


def reverse_teach_entity(entity):
    return reverse('core:topic_view' if entity.entity_type == 'topic' else 'core:item_view', args=(entity.id,))


def get_video_structured_data(video):
    return {'@type': 'VideoObject', 'name': video.video_title,
            'thumbnailUrl': 'https://img.youtube.com/vi/%s/0.jpg' % video.youtube_movie_id,
            'uploadDate': video.video_upload_date,
            'embedUrl': 'https://www.youtube.com/embed/%s' % video.youtube_movie_id,
            'description': video.video_description if video.video_description else video.video_title,
            'duration': video.video_duration}


def get_ancestor_structured_data(args):
    ancestor, position = args
    return {'@type': 'ListItem', 'position': position + 1,
            'item': {'@id': reverse_teach_entity(ancestor), 'name': unicode(ancestor)}}


def get_ancestors_structured_data(ancestors):
    return map(get_ancestor_structured_data, zip(ancestors, range(len(ancestors))))


def get_next_and_prev(teach_topic, teach_item):
    teach_entity_list = sorted(list(teach_topic.teachtopic_set.all()) + list(teach_topic.teachitem_set.all()), key=lambda x: x.order_index)
    index = teach_entity_list.index(teach_item)
    prev_item = teach_entity_list[index - 1] if index > 0 else None
    next_item = teach_entity_list[index + 1] if index < len(teach_entity_list) - 1 else None
    return next_item, prev_item
