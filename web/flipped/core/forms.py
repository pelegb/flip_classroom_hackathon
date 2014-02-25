from __future__ import unicode_literals
from django.utils.translation import ugettext_lazy as _
from wysihtml5.widgets import Wysihtml5TextareaWidget
import floppyforms as forms
import models

class VideoForm(forms.Form):
    edited_id = forms.IntegerField(widget=forms.HiddenInput(),initial=0)
    link = forms.URLField(label=_("link"),
                          widget=forms.TextInput(attrs={'placeholder': 'https://www.youtube.com/watch?v=2H4RkudFzlc'}))
    title = forms.CharField(max_length=50,label=_("title"))
    content = forms.CharField(widget=Wysihtml5TextareaWidget(),label=_("content"))
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all(),required=True, label=_("item"))
    tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all(),required=False, label=_("tags"))

class ReviewForm(forms.Form):
    rel = forms.IntegerField(max_value=10, min_value=1, required=False, label=_("relevancy"))
    quality = forms.IntegerField(max_value=10, min_value=1, required=False, label=_("technical quality"))

