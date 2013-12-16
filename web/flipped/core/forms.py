# -*- coding: UTF-8 -*-
from __future__ import unicode_literals
import floppyforms as forms
from django.conf import settings
from wysihtml5.widgets import Wysihtml5TextareaWidget
import models
from django.utils.translation import ugettext_lazy as _

class VideoForm(forms.Form):
    edited_id = forms.IntegerField(widget=forms.HiddenInput(),initial=0)
    link = forms.URLField(label=_("link"))
    title = forms.CharField(max_length=50,label=_("title"))
    content = forms.CharField(widget=Wysihtml5TextareaWidget(),label=_("content"))
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all(),required=True, label=_("item"))
    tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all(),required=False, label=_("tags"))
    

