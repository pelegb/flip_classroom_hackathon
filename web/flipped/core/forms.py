from django import forms
import models

class VideoForm(forms.Form):
    link = forms.URLField()
    title = forms.CharField(max_length=50)
    content = forms.CharField(widget=forms.Textarea)
    item = forms.ModelChoiceField(queryset=models.TeachItem.objects.all())     
