# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_candidatevideopage'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='videopage',
            name='tags',
        ),
        migrations.DeleteModel(
            name='Tag',
        ),
    ]
