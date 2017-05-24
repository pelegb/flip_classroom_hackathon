import codecs
import csv

import cStringIO

from flipped.settings import GOOGLE_API_KEY
import re
import requests

YOUTUBE_RE = re.compile(
    '^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$')


def parse_video_id_from_link(link):
    return YOUTUBE_RE.match(link).group(1)


def request_youtube_info(video_id, part='id'):
    r = requests.get('https://www.googleapis.com/youtube/v3/videos',
                     params={'key': GOOGLE_API_KEY, 'part': part, 'id': video_id})
    return r.json()


def request_youtube_related_videos(video_id):
    r = requests.get('https://www.googleapis.com/youtube/v3/search',
                     params={'key': GOOGLE_API_KEY, 'part': 'snippet', 'type': 'video', 'relatedToVideoId': video_id,
                             'relevanceLanguage': 'he', 'regionCode': 'IL'})
    return r.json()


def request_youtube_captions(video_id, part='snippet'):
    r = requests.get('https://www.googleapis.com/youtube/v3/captions',
                     params={'key': GOOGLE_API_KEY, 'part': part, 'videoId': video_id})
    return r.json()


class UnicodeWriter:
    """
    A CSV writer which will write rows to CSV file "f",
    which is encoded in the given encoding.
    """

    def __init__(self, f, dialect=csv.excel, encoding="utf-8", **kwds):
        # Redirect output to a queue
        self.queue = cStringIO.StringIO()
        self.writer = csv.writer(self.queue, dialect=dialect, **kwds)
        self.stream = f
        self.encoder = codecs.getincrementalencoder(encoding)()

    def writerow(self, row):
        self.writer.writerow([s.encode("utf-8") for s in row])
        # Fetch UTF-8 output from the queue ...
        data = self.queue.getvalue()
        data = data.decode("utf-8")
        # ... and reencode it into the target encoding
        data = self.encoder.encode(data)
        # write to the target stream
        self.stream.write(data)
        # empty queue
        self.queue.truncate(0)

    def writerows(self, rows):
        for row in rows:
            self.writerow(row)
