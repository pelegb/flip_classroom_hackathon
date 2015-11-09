# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='RatingReview',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('context', models.CharField(max_length=12, choices=[(b'rel', b'Relevancy'), (b'quality', b'Technical quality')])),
                ('rate', models.PositiveSmallIntegerField()),
                ('user', models.ForeignKey(default=None, blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='TeachItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('order_index', models.PositiveIntegerField(default=2147483647)),
                ('video_count_cache', models.PositiveIntegerField(default=None, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TeachTopic',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('order_index', models.PositiveIntegerField(default=2147483647)),
                ('video_count_cache', models.PositiveIntegerField(default=None, null=True)),
                ('parent', models.ForeignKey(blank=True, to='core.TeachTopic', null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TextualReview',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('textual_review', models.CharField(max_length=500)),
                ('user', models.ForeignKey(default=None, blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TopicSuggestion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('email', models.EmailField(default=None, max_length=254, null=True, blank=True)),
                ('title', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('youtube_url', models.CharField(max_length=50, null=True, blank=True)),
                ('parent_topic', models.ForeignKey(blank=True, to='core.TeachTopic', null=True)),
                ('user', models.ForeignKey(default=None, blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='VideoPage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('youtube_movie_id', models.CharField(max_length=25)),
                ('youtube_channel', models.CharField(max_length=200)),
                ('upload_date', models.DateTimeField(auto_now_add=True, verbose_name=b'date uploaded to our site')),
                ('content', models.TextField()),
                ('video_title', models.CharField(max_length=50)),
                ('category', models.CharField(default=b'LESSON', max_length=40, choices=[(b'LESSON', 'LESSON'), (b'DEMONSTRATION', 'DEMONSTRATION'), (b'EXPERIMENT', 'EXPERIMENT'), (b'PROBLEM_SOLVING', 'PROBLEM_SOLVING'), (b'ADVANCED', 'ADVANCED'), (b'OTHER', 'OTHER')])),
                ('tags', models.ManyToManyField(related_name='videos', null=True, to='core.Tag', blank=True)),
                ('teach_item', models.ForeignKey(blank=True, to='core.TeachItem', null=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='textualreview',
            name='video',
            field=models.ForeignKey(to='core.VideoPage'),
        ),
        migrations.AddField(
            model_name='teachitem',
            name='parent',
            field=models.ForeignKey(blank=True, to='core.TeachTopic', null=True),
        ),
        migrations.AddField(
            model_name='ratingreview',
            name='video',
            field=models.ForeignKey(to='core.VideoPage'),
        ),
    ]
