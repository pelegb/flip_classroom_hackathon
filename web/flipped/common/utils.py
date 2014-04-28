from core.models import TeachTopic
import re

YOUTUBE_RE = re.compile('^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$')

def parse_video_id_from_link(link):
    return YOUTUBE_RE.match(link).group(1)

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

