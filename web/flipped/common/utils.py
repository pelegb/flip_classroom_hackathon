from core.models import TeachTopic
import re

YOUTUBE_RE = re.compile('^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$')


def parse_video_id_from_link(link):
    return YOUTUBE_RE.match(link).group(1)
