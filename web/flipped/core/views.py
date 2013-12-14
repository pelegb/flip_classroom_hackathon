from django.shortcuts import render, get_object_or_404
from models import VideoPage
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect
import django.contrib.auth
import common.utils
from django.contrib.auth.decorators import login_required
import forms
from models import TeachTopic
from models import TeachItem
from django.db import models
# Create your views here.

def video_detail(request, video_id):
    video = get_object_or_404(VideoPage, pk=video_id)
    return render(request, 'core/video_detail.html', {'video': video})


#@login_required
def add_video(request):
    if request.method == 'GET':
        form = forms.VideoForm()
    elif request.method == 'POST':
        form = forms.VideoForm(request.POST)
        if form.is_valid():
            v = VideoPage()
            v.content = form.cleaned_data['content']
            v.youtube_movie_id = common.utils.parse_video_id_from_link(form.cleaned_data['link'])
            v.video_title = form.cleaned_data['title']
            v.teach_item = form.cleaned_data['item']
            v.user = django.contrib.auth.get_user_model().objects.all()[0]
            v.save()
        return HttpResponseRedirect(reverse('core:video_detail',kwargs=dict(video_id=v.id)))
    return render(request,'core/add_video.html',dict(form=form))

def topic_view(request,topic_id):
    topic = get_object_or_404(TeachTopic, pk=topic_id)
    subtree = common.utils.get_subtree_from_topic(topic)
    item_list = TeachItem.objects.filter(parent=topic)
    ancestors = common.utils.get_ancestry_from_entity(topic)
    return render(request, 'core/topic_view.html', {'topic': topic, 'subtree':subtree, 'ancestors': ancestors, 'item_list':item_list})

def item_view(request,item_id):
    item = get_object_or_404(TeachItem, pk=item_id)
    videos = VideoPage.objects.filter(teach_item=item)
    ancestors = common.utils.get_ancestry_from_entity(item)
    return render(request, 'core/item_view.html', {'item': item, 'videos':videos, 'ancestors':ancestors})
