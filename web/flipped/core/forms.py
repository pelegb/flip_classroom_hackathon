# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from common.utils import parse_video_id_from_link, request_youtube_info
from core.models import VideoPage
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
from wysihtml5.widgets import Wysihtml5TextareaWidget
import floppyforms as forms
import models


def validate_youtube(value):
    """
    Validate url value is one of the following
    youtube.com/watch/?v=AAAAAAA
    www.youtube.com/watch/?v=AAAAAAA
    http://youtube.com/watch/?v=AAAAAAA
    http://www.youtube.com/watch/?v=AAAAAAA
    https://youtube.com/watch/?v=AAAAAAA
    https://www.youtube.com/watch/?v=AAAAAAA
    youtu.be/AAAAA
    www.youtu.be/AAAAA
    http://youtu.be/AAAAA
    http://www.youtu.be/AAAAA
    https://youtu.be/AAAAA
    https://www.youtu.be/AAAAA
    """
    try:
        video_id = parse_video_id_from_link(value)
    except:
        raise ValidationError(_(u'Invalid YouTube URL'))

    try:
        assert request_youtube_info(video_id=video_id, part='id')['pageInfo']['totalResults'] == 1
    except:
        raise ValidationError(_(u'Video could not be found on YouTube for ID: %(id)s') % {'id': video_id})


class VideoForm(forms.Form):
    edited_id = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
    link = forms.URLField(label=_("link"),
                          widget=forms.TextInput(attrs={'placeholder': u'לדוגמא, https://www.youtube.com/watch?v=2H4RkudFzlc',
                                                        'class': 'wideTextInput',
                                                        'required': True}),
                          validators=[validate_youtube])
    title = forms.CharField(max_length=models.VideoPage.VIDEO_TITLE_LENGTH, label=_("title"),
                            widget=forms.TextInput(attrs={'placeholder': u'לדוגמא, ״הדגמת תנועת מטוטלת, מורה - איתמר״',
                                                          'class': 'wideTextInput',
                                                          'required': True}))

    content = forms.CharField(widget=Wysihtml5TextareaWidget(), label=_("content"))
    category = forms.ChoiceField(choices=VideoPage.CATEGORY_DESCRIPTION_CHOICES, required=True, label=_('category'),
                                 widget=forms.Select(attrs={'class': 'wideTextInput', 'required': True}),)
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all(), required=True, label=_("item"))
    # tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all(),required=False, label=_("tags"))


class ReviewForm(forms.Form):
    rel = forms.IntegerField(max_value=10, min_value=1, required=False, label=_("relevancy"))
    quality = forms.IntegerField(max_value=10, min_value=1, required=False, label=_("technical quality"))
