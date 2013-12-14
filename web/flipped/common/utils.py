import urlparse
import models
from core.models import TeachTopic
from core.models import TeachItem
from core.models import VideoPage
from django.db import models


def parse_video_id_from_link(link):
    url_data = urlparse.urlparse(link)
    query = urlparse.parse_qs(url_data.query)
    return query['v'][0]

def get_ancestry_from_entity(entity):
#gets an entity and returns ancestor list sorted from highest to lowest, not including entity
    ancestors=[]
    while entity:
        ancestors.insert(0,entity)
        entity = entity.parent
    return ancestors

def get_subtree_from_topic(topic):
#gets a topic and returns a map, mapping each topic to its children, which are in turn similar maps. Terminal topics map to None, and items map to their count
    subtree={}
    for child_topic in TeachTopic.objects.filter(parent=topic):
        subtree[child_topic]=get_subtree_from_topic(child_topic)
    return subtree
