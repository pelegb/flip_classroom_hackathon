from core.models import TeachTopic
import re

YOUTUBE_RE = re.compile('^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$')


def parse_video_id_from_link(link):
    return YOUTUBE_RE.match(link).group(1)


def get_ancestry_from_entity(entity):
#gets an entity and returns ancestor list sorted from highest to lowest, not including entity
    ancestors=[]
    while entity:
        ancestors.insert(0, entity)
        entity = entity.parent
    return ancestors


