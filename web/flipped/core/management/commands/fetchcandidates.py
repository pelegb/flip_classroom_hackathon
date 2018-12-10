import progressbar
from django.core.management import BaseCommand

from common.utils import request_youtube_related_videos, request_youtube_info, request_youtube_captions
from core.models import VideoPage, CandidateVideoPage


class Command(BaseCommand):
    help = 'Fetches candidate videos from YouTube\'s API'

    def __init__(self, *args, **kwargs):
        super(Command, self).__init__(*args, **kwargs)
        self.related_video_ids = set()

    def handle(self, *args, **options):
        video_count = VideoPage.objects.count()
        with progressbar.ProgressBar(max_value=video_count) as bar:
            for i, video in zip(range(video_count), VideoPage.objects.order_by('-id').all()):
                related_videos = request_youtube_related_videos(video.youtube_movie_id)
                if 'items' in related_videos:
                    for related_video in related_videos['items']:
                        related_video_id = related_video['id']['videoId']
                        if self._validate_duplicates(related_video_id) and \
                                self._validate_existence(related_video_id):
                            self._create_candidate(related_video, video)
                else:
                    print related_videos
                bar.update(i)

    def _validate_duplicates(self, related_video_id):
        try:
            CandidateVideoPage.objects.get(youtube_movie_id=related_video_id)
            return False
        except CandidateVideoPage.DoesNotExist:
            return True

    def _validate_existence(self, related_video_id):
        try:
            VideoPage.objects.get(youtube_movie_id=related_video_id)
            return False
        except (VideoPage.DoesNotExist, VideoPage.MultipleObjectsReturned):
            return True

    def _create_candidate(self, related_video, video):
        candidate = CandidateVideoPage(related_video_page=video)
        candidate.youtube_movie_id = related_video['id']['videoId']
        candidate.youtube_channel = related_video['snippet']['channelTitle']
        candidate.youtube_channel_id = related_video['snippet']['channelId']
        candidate.video_title = related_video['snippet']['title'][:CandidateVideoPage.VIDEO_TITLE_LENGTH]
        candidate.video_description = related_video['snippet']['description'][:CandidateVideoPage.VIDEO_DESCRIPTION_LENGTH]
        candidate.video_upload_date = related_video['snippet']['publishedAt']
        candidate.save()

        response = request_youtube_info(related_video['id']['videoId'], part='contentDetails')
        candidate.video_duration = response['items'][0]['contentDetails']['duration']
        candidate.save()

        response = request_youtube_captions(related_video['id']['videoId'])
        candidate.video_subtitles = ','.join([item['snippet']['language'] for item in response['items']])
        candidate.save()
