from flipped.settings import GOOGLE_API_KEY
import re
import requests

YOUTUBE_RE = re.compile('^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$')


def parse_video_id_from_link(link):
    return YOUTUBE_RE.match(link).group(1)


def request_youtube_info(video_id, part='id'):
    r = requests.get('https://www.googleapis.com/youtube/v3/videos', params={'key': GOOGLE_API_KEY, 'part': part, 'id': video_id})
    return r.json()
