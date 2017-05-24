import progressbar
from django.core.management import BaseCommand

from common.utils import request_youtube_related_videos, UnicodeWriter, request_youtube_info, request_youtube_captions
from core.models import VideoPage


class Command(BaseCommand):
    help = 'Fetches candidate videos from YouTube\'s API'

    def __init__(self, *args, **kwargs):
        super(Command, self).__init__(*args, **kwargs)
        self.related_video_ids = set()

    def add_arguments(self, parser):
        parser.add_argument('--output-file', dest='output_file', default='output.csv', help='Output CSV file')

    def handle(self, *args, **options):
        with open(options['output_file'], 'wb') as f:
            writer = UnicodeWriter(f)
            writer.writerow(['Video Id', 'Published At', 'Title', 'Description', 'Channel', 'Duration', 'Hebrew?',
                             'Hebrew captions'])
            self.related_video_ids = set()
            video_count = VideoPage.objects.count()
            with progressbar.ProgressBar(max_value=video_count) as bar:
                for i, video in zip(range(video_count), VideoPage.objects.all()):
                    related_videos = request_youtube_related_videos(video.youtube_movie_id)
                    for related_video in related_videos['items']:
                        related_video_id = related_video['id']['videoId']
                        if self._validate_duplicates(related_video_id) and \
                                self._validate_existence(related_video_id):
                            self._enrich(related_video)
                            writer.writerow([related_video_id, related_video['snippet']['publishedAt'],
                                             related_video['snippet']['title'],
                                             related_video['snippet']['description'],
                                             related_video['snippet']['channelTitle'],
                                             related_video['enrichment']['duration'],
                                             related_video['enrichment']['hebrew'],
                                             related_video['enrichment']['hebrew_captions']])
                    bar.update(i)

    def _validate_duplicates(self, related_video_id):
        valid = related_video_id not in self.related_video_ids
        if valid:
            self.related_video_ids.add(related_video_id)
        return valid

    def _validate_existence(self, related_video_id):
        try:
            VideoPage.objects.get(youtube_movie_id=related_video_id)
            return False
        except VideoPage.DoesNotExist:
            return True
        except:
            return False

    def _contains_hebrew(self, related_video):
        contains = any(u"\u0590" <= c <= u"\u05EA" for c in related_video['snippet']['title']) or \
                   any(u"\u0590" <= c <= u"\u05EA" for c in related_video['snippet']['description'])

        return contains

    def _enrich(self, related_video):
        related_video['enrichment'] = {}

        response = request_youtube_info(related_video['id']['videoId'], part='contentDetails')
        related_video['enrichment']['duration'] = response['items'][0]['contentDetails']['duration']

        if self._contains_hebrew(related_video):
            related_video['enrichment']['hebrew'] = 'True'
            related_video['enrichment']['hebrew_captions'] = 'NA'
        else:
            related_video['enrichment']['hebrew'] = 'False'
            response = request_youtube_captions(related_video['id']['videoId'])
            related_video['enrichment']['hebrew_captions'] = 'True' if any(
                item['snippet']['language'].startswith('he') for item in response['items']) else 'False'
