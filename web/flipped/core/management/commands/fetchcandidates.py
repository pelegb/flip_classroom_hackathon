import progressbar
from django.core.management import BaseCommand

from common.utils import request_youtube_related_videos, UnicodeWriter, request_youtube_info
from core.models import VideoPage


class Command(BaseCommand):
    help = 'Fetches candidate videos from YouTube\'s API'

    def add_arguments(self, parser):
        parser.add_argument('--output-file', dest='output_file', default='output.csv', help='Output CSV file')

    def handle(self, *args, **options):
        with open(options['output_file'], 'wb') as f:
            writer = UnicodeWriter(f)
            writer.writerow(['Video Id', 'Published At', 'Title', 'Description', 'Channel', 'Duration'])

            related_video_ids = set()
            video_count = VideoPage.objects.count()
            with progressbar.ProgressBar(max_value=video_count) as bar:
                for i, video in zip(range(video_count), VideoPage.objects.all()):
                    related_videos = request_youtube_related_videos(video.youtube_movie_id)
                    for related_video in related_videos['items']:
                        related_video_id = related_video['id']['videoId']
                        if related_video_id not in related_video_ids:
                            related_video_ids.add(related_video_id)
                            try:
                                VideoPage.objects.get(youtube_movie_id=related_video_id)
                            except VideoPage.DoesNotExist:
                                video_info = request_youtube_info(related_video_id, part='contentDetails')['items'][0]
                                writer.writerow([related_video_id, related_video['snippet']['publishedAt'],
                                                 related_video['snippet']['title'],
                                                 related_video['snippet']['description'],
                                                 related_video['snippet']['channelTitle'],
                                                 video_info['contentDetails']['duration']])
                            except:
                                pass
                    bar.update(i)
