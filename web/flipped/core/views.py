from core.models import RatingReview
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, get_object_or_404
from models import TeachItem, TeachTopic, VideoPage, TagVideo, Tag
import common.utils
import forms
from django.views.decorators.csrf import csrf_exempt
# Create your views here.

def video_detail(request, video_id):
    video = get_object_or_404(VideoPage, pk=video_id)
    ancestors = common.utils.get_ancestry_from_entity(video.teach_item)
    if request.method == 'GET':
        form = forms.ReviewForm()
    elif request.method == 'POST':
        form = forms.ReviewForm(request.POST)
        if request.user.is_authenticated() and form.is_valid():
            for context in RatingReview.context_choices:
                if form.cleaned_data[context[0]]:
                    review = RatingReview()
                    review.user = request.user
                    review.video = video
                    review.context = context[0]
                    review.rate = form.cleaned_data[context[0]]
                    review.save()
        else:
            print form.errors
    return render(request, 'core/video_detail.html', {'video': video, 'ancestors':ancestors, 'form':form})

@csrf_exempt
def video_rate(req,video_id):
    video = get_object_or_404(VideoPage, pk=video_id)
    user = req.user
    return HttpResponse(status=201)

@login_required
def add_video(request,video_id=None):
    if request.method == 'GET':
        if not video_id:
            form = forms.VideoForm()
        else:
            initial = dict()
            video = VideoPage.objects.get(id=video_id)
            initial['content'] = video.content
            initial['tags'] = Tag.objects.filter(id__in=video.tagvideo_set.all().values_list('tag')) 
            initial['title'] = video.video_title
            initial['link'] = 'http://www.youtube.com/watch?v=%s' % (video.youtube_movie_id)
            initial['item'] = video.teach_item
            initial['edited_id'] = video.id
            form = forms.VideoForm(initial=initial)
    elif request.method == 'POST':
        form = forms.VideoForm(request.POST)
        if form.is_valid():
            if form.cleaned_data['edited_id']:
                v = VideoPage.objects.get(id=form.cleaned_data['edited_id'])
            else:
                v = VideoPage()
            v.content = form.cleaned_data['content']
            v.youtube_movie_id = common.utils.parse_video_id_from_link(form.cleaned_data['link'])
            v.video_title = form.cleaned_data['title']
            v.teach_item = form.cleaned_data['item']
            v.user = request.user
            v.save()
            TagVideo.objects.filter(video=v).delete()
            for t in form.cleaned_data['tags']:
                TagVideo.objects.get_or_create(video=v,tag=t)
        
            return HttpResponseRedirect(reverse('core:video_detail',kwargs=dict(video_id=v.id)))
        else:
            print form.errors
    return render(request,'core/add_video.html',dict(form=form))

def topic_view(request,topic_id):
    topic = get_object_or_404(TeachTopic, pk=topic_id)
    subtree = common.utils.get_subtree_from_topic(topic)
    subtree = subtree[1:]
    item_list = TeachItem.objects.filter(parent=topic)
    ancestors = common.utils.get_ancestry_from_entity(topic)
    ancestors = ancestors[:-1]
    return render(request,'core/topic_view.html', {'topic': topic, 'subtree':subtree, 'ancestors': ancestors, 'item_list':item_list})

def item_view(request,item_id):
    item = get_object_or_404(TeachItem, pk=item_id)
    videos = VideoPage.objects.filter(teach_item=item)
    ancestors = common.utils.get_ancestry_from_entity(item)
    ancestors = ancestors[:-1]
    return render(request,'core/item_view.html', {'item': item, 'videos':videos, 'ancestors':ancestors})

