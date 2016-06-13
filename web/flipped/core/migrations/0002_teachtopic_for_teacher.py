# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


def set_teacher_topics(apps, schema_editor):
    TeachTopic = apps.get_model('core', 'TeachTopic')
    TeachTopic.objects.all().update(for_teacher=False)
    TeachTopic.objects.filter(title__in=[u'איך להקליט סרטון?', u'הוראה באמצעות סרטונים']).update(for_teacher=True)

class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='teachtopic',
            name='for_teacher',
            field=models.BooleanField(default=False),
        ),
        migrations.RunPython(set_teacher_topics),
    ]
