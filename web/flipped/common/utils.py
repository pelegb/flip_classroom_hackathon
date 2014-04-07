import urlparse
from core.models import TeachTopic

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
#gets a topic and returns a list representing the topic tree rooted in topic
#the tree contains the string "down"/"up to indicate going down/up a level
    subtree=[topic]
    for child_topic in TeachTopic.objects.filter(parent=topic).order_by('order_index'):
        subtree.extend(["in"]+get_subtree_from_topic(child_topic)+["out"])
    return subtree

