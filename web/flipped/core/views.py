from core.models import RatingReview
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, get_object_or_404
from models import TeachItem, TeachTopic, VideoPage
import common.utils
import forms
import json
# Create your views here.

def get_global_ratings(video):
    from django.db.models import Avg,Count
    total_quality = RatingReview.objects.filter(context='quality',video=video).aggregate(count=Count('rate'),average=Avg('rate'))
    rate_quality = dict(average=int(round(total_quality['average'] or 0)),
                        count=total_quality['count'])

    total_rel = RatingReview.objects.filter(context='rel',video=video).aggregate(count=Count('rate'),average=Avg('rate'))
    rate_rel = dict(average=int(round(total_rel['average'] or 0)),
                    count=total_rel['count'])

    return dict(rate_quality=rate_quality,rate_rel=rate_rel)

def video_detail(request, video_id):

    video = get_object_or_404(VideoPage, pk=video_id)
    ancestors = common.utils.get_ancestry_from_entity(video.teach_item)
    ctx = dict(video = video, ancestors = ancestors)
    ctx.update(get_global_ratings(video))

    if request.user.is_authenticated():
        try:
            ctx['rate_quality']['cur'] = RatingReview.objects.get(user=request.user,context='quality',video=video).rate
        except RatingReview.DoesNotExist:
            ctx['rate_quality']['cur'] = ''
        try:
            ctx['rate_rel']['cur'] = RatingReview.objects.get(user=request.user,context='rel',video=video).rate
        except RatingReview.DoesNotExist:
            ctx['rate_rel']['cur'] = ''
    return render(request, 'core/video_detail.html', ctx)

@login_required
def video_rate(request,video_id):
    if request.method == 'POST':
        video = get_object_or_404(VideoPage, pk=video_id)
        try:
            if request.user.is_authenticated():
                for context_tuple in RatingReview.context_choices:
                    context = context_tuple[0]
                    rate =  int(request.POST['rating_%s' % (context)])
                    review,created = RatingReview.objects.get_or_create(user=request.user,video=video,context=context,defaults={'rate':rate})
                    # if not new - must update the rate
                    if not created:
                        review.rate = rate
                        review.save()
                result = get_global_ratings(video)
                return HttpResponse(status=201,content=json.dumps(result),content_type='application/json')
        except Exception,e:
            error_dict = dict(error=unicode(e))
            return HttpResponse(status=400,content=json.dumps(error_dict),content_type='application/json')



@login_required
def add_video(request,video_id=None):
    if request.method == 'GET':
        if not video_id:
            form = forms.VideoForm()
        else:
            initial = dict()
            video = VideoPage.objects.get(id=video_id)
            initial['content'] = video.content
            initial['tags'] = video.tags.all()
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
            v.tags.clear()
            #for t in form.cleaned_data['tags']:
            #    v.tags.add(t)

            return HttpResponseRedirect(reverse('core:video_detail',kwargs=dict(video_id=v.id)))
        else:
            print form.errors
    return render(request,'core/add_video.html',dict(form=form))

def topic_view(request,topic_id):
    topic = get_object_or_404(TeachTopic, pk=topic_id)
    subtree = common.utils.get_subtree_from_topic(topic)
    subtree = subtree[1:]
    item_list = TeachItem.objects.filter(parent=topic).order_by('order_index')
    ancestors = common.utils.get_ancestry_from_entity(topic)
    ancestors = ancestors[:-1]
    return render(request,'core/topic_view.html', {'topic': topic, 'subtree':subtree, 'ancestors': ancestors, 'item_list':item_list})

def item_view(request,item_id):
    item = get_object_or_404(TeachItem, pk=item_id)
    videos = list(VideoPage.objects.filter(teach_item=item))
    ancestors = common.utils.get_ancestry_from_entity(item)
    ancestors = ancestors[:-1]
    return render(request,'core/item_view.html', {'item': item, 'videos':sorted(videos, key=lambda video: video.relevancy_rating()['average'], reverse=True), 'ancestors':ancestors})

@login_required
def user_view(request):
    videos = VideoPage.objects.filter(user=request.user)
    return render(request, 'core/user_view.html', {'videos': videos})
