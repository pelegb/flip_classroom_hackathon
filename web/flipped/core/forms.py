# -*- coding: UTF-8 -*-
from __future__ import unicode_literals
import floppyforms as forms
from django.conf import settings
from wysihtml5.widgets import Wysihtml5TextareaWidget
import models


translations = {
    "link" : "קישור",
    "title": "כותרת",
    "content": "תוכן",
    "item": "שיוך",
    "tags": "תגיות",
}

class VideoForm(forms.Form):
    edited_id = forms.IntegerField(widget=forms.HiddenInput(),initial=0)
    link = forms.URLField(label=translations['link'])
    title = forms.CharField(max_length=50, label=translations['title'])
    content = forms.CharField(widget=Wysihtml5TextareaWidget(), label=translations['content'])
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all(),required=True, label=translations['item'])
    tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all(),required=False, label=translations['tags'])

