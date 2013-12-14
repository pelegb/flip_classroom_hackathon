from django import forms
from django.conf import settings
from wysihtml5.widgets import Wysihtml5TextareaWidget
import models

class VideoForm(forms.Form):
    link = forms.URLField()
    title = forms.CharField(max_length=50)
    content = forms.CharField(widget=Wysihtml5TextareaWidget(
                attrs={'rows': 20, 'cols': 80},
                #toolbar_settings=settings.WYSIHTML5_BOOTSTRAP_TOOLBAR
    ))
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all())     
    tags = forms.ModelMultipleChoiceField(queryset=models.Tag.objects.all())
    
    