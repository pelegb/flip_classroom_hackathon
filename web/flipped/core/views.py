from collections import defaultdict
from common.processors import topics
from common.utils import request_youtube_info
from core.models import RatingReview
from core.utils import get_jstree_data
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.utils.translation import ugettext
from models import TeachItem, TeachTopic, VideoPage, TopicSuggestion
import common.utils
import forms
import itertools
import json


def get_global_ratings(video):
    from django.db.models import Avg, Count

    total_quality = RatingReview.objects.filter(context='quality', video=video).aggregate(count=Count('rate'),
                                                                                          average=Avg('rate'))
    rate_quality = dict(average=int(round(total_quality['average'] or 0)),
                        count=total_quality['count'])

    total_rel = RatingReview.objects.filter(context='rel', video=video).aggregate(count=Count('rate'),
                                                                                  average=Avg('rate'))
    rate_rel = dict(average=int(round(total_rel['average'] or 0)),
                    count=total_rel['count'])

    return dict(rate_quality=rate_quality, rate_rel=rate_rel)


def video_detail(request, video_id):
    video = get_object_or_404(VideoPage, pk=video_id)
    ancestors = video.teach_item.get_ancestry()
    ctx = dict(video=video, ancestors=ancestors, title=video.video_title)
    ctx.update(get_global_ratings(video))

    if request.user.is_authenticated():
        try:
            ctx['rate_quality']['cur'] = RatingReview.objects.get(user=request.user, context='quality',
                                                                  video=video).rate
        except RatingReview.DoesNotExist:
            ctx['rate_quality']['cur'] = ''
        try:
            ctx['rate_rel']['cur'] = RatingReview.objects.get(user=request.user, context='rel', video=video).rate
        except RatingReview.DoesNotExist:
            ctx['rate_rel']['cur'] = ''
    return render(request, 'core/video_detail.html', ctx)


def video_rate(request, video_id):
    try:
        video = get_object_or_404(VideoPage, pk=video_id)
        if request.method == 'POST':
            for context_tuple in RatingReview.context_choices:
                context = context_tuple[0]
                rate = int(request.POST['rating_%s' % context])
                if request.user.is_authenticated():
                    review, created = RatingReview.objects.get_or_create(user=request.user, video=video,
                                                                         context=context, defaults={'rate': rate})
                    # if not new - must update the rate
                    if not created:
                        review.rate = rate
                        review.save()
                else:
                    if request.session.get('has_rated', False):
                        review = RatingReview.objects.create(user=None, video=video, context=context, rate=rate)
                        request.session['has_rated'] = True
                    else:
                        return HttpResponse(status=403, content=ugettext("You've already rated this video"))

        result = get_global_ratings(video)
        return HttpResponse(status=201, content=json.dumps(result), content_type='application/json')
    except Exception, e:
        error_dict = dict(error=unicode(e))
        return HttpResponse(status=400, content=json.dumps(error_dict), content_type='application/json')


@login_required
def add_video(request, video_id=None):
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
            initial['category'] = video.category
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
            v.category = form.cleaned_data['category']
            v.user = request.user
            v.youtube_channel = \
                request_youtube_info(video_id=v.youtube_movie_id, part='snippet')['items'][0]['snippet']['channelTitle']
            v.save()
            v.tags.clear()
            # for t in form.cleaned_data['tags']:
            # v.tags.add(t)

            v.teach_item.purge_video_count()

            return HttpResponseRedirect(reverse('core:video_detail', kwargs=dict(video_id=v.id)))
        else:
            print form.errors

    root_topics = list(topics(request)['topics'])
    root_subtree = list(itertools.chain.from_iterable(map(lambda topic: topic.get_subtree(), root_topics)))
    root_topics.extend(root_subtree)
    jstree_data = get_jstree_data(root_topics, None, opened=False, enable_items_only=True, include_video_count=False)
    return render(request, 'core/add_video.html', dict(form=form, jstree_data=json.dumps(jstree_data)))


def topic_view(request, topic_id):
    topic = get_object_or_404(TeachTopic, pk=topic_id)
    ancestors = topic.get_ancestry()
    ancestors = ancestors[:-1]

    subtree = topic.get_subtree()
    tree_data = get_jstree_data(subtree, topic.id, opened=False)
    return render(request, 'core/topic_view.html',
                  {'topic': topic, 'tree_data': json.dumps(tree_data), 'ancestors': ancestors, 'title': topic.title})


def item_view(request, item_id):
    item = get_object_or_404(TeachItem, pk=item_id)
    videos = VideoPage.objects.filter(teach_item=item)
    videos_dict = defaultdict(list)
    for v in videos:
        videos_dict[v.category].append(v)

    videos_list = [(ugettext(category + '_plural'), videos_dict[category]) for category in VideoPage.CATEGORY_VALUES]

    for category, v in videos_list:
        v.sort(key=lambda video: video.relevancy_rating()['average'], reverse=True)

    ancestors = item.get_ancestry()
    ancestors = ancestors[:-1]
    return render(request, 'core/item_view.html',
                  {'item': item, 'videos_list': videos_list, 'ancestors': ancestors, 'title': item.title})


@login_required
def user_view(request):
    videos = VideoPage.objects.filter(user=request.user)
    return render(request, 'core/user_view.html', {'videos': videos, 'title': request.user.get_full_name()})


def suggest_topic(request, parent_id):
    if request.method == 'GET':
        form = forms.TopicSuggestForm()
    elif request.method == 'POST':
        form = forms.TopicSuggestForm(request.POST)
        if form.is_valid():
            s = TopicSuggestion()
            s.user = request.user if request.user.is_authenticated() else None
            s.title = form.cleaned_data['title']
            s.email = form.clean_data['email']
            s.description = form.cleaned_data['description']
            s.parent_topic = get_object_or_404(TeachTopic, pk=parent_id)
            s.youtube_url = form.cleaned_data['youtube_url']
            s.save()
            return HttpResponseRedirect(reverse('core:topic_view', kwargs=dict(topic_id=parent_id)))
        else:
            print form.errors
    return render(request, 'core/suggest_topic.html', dict(form=form, parent_id=parent_id))
