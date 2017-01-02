# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_teachtopic_for_teacher'),
    ]

    operations = [
        migrations.AddField(
            model_name='videopage',
            name='video_description',
            field=models.CharField(max_length=512, null=True),
        ),
        migrations.AddField(
            model_name='videopage',
            name='video_duration',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='videopage',
            name='video_upload_date',
            field=models.DateTimeField(null=True, verbose_name=b'date uploaded to Youtube'),
        ),
    ]
