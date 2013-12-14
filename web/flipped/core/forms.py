from django import forms
from django.conf import settings
from wysihtml5.widgets import Wysihtml5TextareaWidget
import models

class VideoForm(forms.Form):
    edited_id = forms.IntegerField(widget=forms.HiddenInput(),initial=0)
    link = forms.URLField()
    title = forms.CharField(max_length=50)
    content = forms.CharField(widget=Wysihtml5TextareaWidget())
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all(),required=True)     
    tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all(),required=False)
    
    