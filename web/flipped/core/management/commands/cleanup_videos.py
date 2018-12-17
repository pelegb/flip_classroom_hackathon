import sys

import progressbar
from django.core.management import BaseCommand

from common.utils import request_youtube_info
from core.models import VideoPage


class Command(BaseCommand):
    help = 'Cleanup videos which were deleted from Youtube'

    def __init__(self, *args, **kwargs):
        super(Command, self).__init__(*args, **kwargs)

    def add_arguments(self, parser):
        parser.add_argument('--delete', action='store_true', dest='delete', default=False, help='Delete videos')

    def handle(self, *args, **options):
        video_count = VideoPage.objects.count()
        to_delete = []
        to_delete_titles = []
        with progressbar.ProgressBar(max_value=video_count) as bar:
            for offset in range(0, video_count, 20):
                videos = VideoPage.objects.order_by('id')[offset:offset + 20]
                videos_by_id = {video.youtube_movie_id: video for video in videos}
                info = request_youtube_info(','.join(videos_by_id.keys()))
                youtube_ids = {youtube_info['id'] for youtube_info in info['items']}
                video_ids = set(videos_by_id.keys())
                video_ids_to_delete = video_ids - youtube_ids
                to_delete.extend([videos_by_id[video_id].id for video_id in video_ids_to_delete])
                to_delete_titles.extend([videos_by_id[video_id].video_title for video_id in video_ids_to_delete])
                bar.update(offset)
        print 'Length', len(to_delete_titles)
        msg = repr([x.encode(sys.stdout.encoding) for x in to_delete_titles]).decode('string-escape')
        print msg
        if options['delete']:
            print 'Deleting...'
            for video_id in to_delete:
                print video_id
                video = VideoPage.objects.get(pk=video_id)
                video.delete()
