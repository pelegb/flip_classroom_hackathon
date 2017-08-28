# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20161226_2051'),
    ]

    operations = [
        migrations.CreateModel(
            name='CandidateVideoPage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('youtube_movie_id', models.CharField(unique=True, max_length=25)),
                ('youtube_channel', models.CharField(max_length=200)),
                ('video_title', models.CharField(max_length=50)),
                ('video_description', models.CharField(max_length=512, null=True)),
                ('video_upload_date', models.DateTimeField(null=True, verbose_name=b'date uploaded to Youtube')),
                ('video_duration', models.CharField(max_length=20, null=True)),
                ('video_subtitles', models.CharField(max_length=256, null=True)),
                ('candidate_reason', models.CharField(default=b'related_video', max_length=40, choices=[(b'related_video', b'related_video')])),
                ('state', models.CharField(default=b'candidate', max_length=40, choices=[(b'candidate', b'candidate'), (b'promoted', b'promoted'), (b'irrelevant', b'irrelevant'), (b'review later', b'review later')])),
                ('related_video_page', models.ForeignKey(related_name='candidate_videos', blank=True, to='core.VideoPage', null=True)),
                ('video_page', models.OneToOneField(null=True, blank=True, to='core.VideoPage')),
            ],
        ),
    ]
