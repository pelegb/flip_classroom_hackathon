# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations

from common.utils import request_youtube_info


def load_youtube_data(apps, schema_editor):
    VideoPage = apps.get_model('core', 'VideoPage')
    for video in VideoPage.objects.exclude(video_description__isnull=False):
        response = request_youtube_info(video_id=video.youtube_movie_id, part='snippet,contentDetails')
        if 'items' in response and len(response['items']) > 0:
            youtube_info = response['items'][0]
            print youtube_info
            video.youtube_channel = youtube_info['snippet']['channelTitle']
            video.video_description = youtube_info['snippet']['description'][:512]
            video.video_upload_date = youtube_info['snippet']['publishedAt']
            video.video_duration = youtube_info['contentDetails']['duration']
            video.save()


class Migration(migrations.Migration):
    dependencies = [
        ('core', '0003_auto_20161226_2048'),
    ]

    operations = [
        migrations.RunPython(load_youtube_data, lambda x, y: True)
    ]
