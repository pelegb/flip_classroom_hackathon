import itertools
import json
import logging

from collections import defaultdict
from django.contrib.auth.decorators import login_required
from django.core.serializers.json import DjangoJSONEncoder
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect, Http404, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.utils.translation import ugettext_lazy

import common.utils
import forms
from common.utils import request_youtube_info
from core.models import RatingReview, CandidateVideoPage
from core.utils import get_jstree_data, get_video_structured_data, get_ancestors_structured_data, get_next_and_prev
from models import TeachItem, TeachTopic, VideoPage, TopicSuggestion

logger = logging.getLogger(__name__)


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
    next_item, prev_item = get_next_and_prev(ancestors[-2], video.teach_item)
    ctx = dict(video=video, ancestors=ancestors, title=video.video_title, next=next_item, prev=prev_item)
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

    structured_data = [get_video_structured_data(video),
                       {'@type': 'BreadcrumbList', 'itemListElement': get_ancestors_structured_data(ancestors) + [
                           {'@type': 'ListItem', 'position': len(ancestors) + 1, 'item': {'@id': reverse('core:video_detail', args=(video.id,)), 'name': unicode(video)}}]}]
    ctx['ld_json'] = json.dumps(structured_data, cls=DjangoJSONEncoder)[1:-1]
    candidate_videos_query = video.candidate_videos.filter(state=CandidateVideoPage.STATE_CANDIDATE).order_by('id')
    if request.session.get('rated_candidates', False):
        candidate_videos_query = candidate_videos_query.exclude(id__in=request.session.get('rated_candidates'))
    ctx['candidate_video'] = candidate_videos_query.first()
    return render(request, 'core/video_detail.html', ctx)


# def video_rate(request, video_id):
#     try:
#         video = get_object_or_404(VideoPage, pk=video_id)
#         if request.method == 'POST':
#             for context_tuple in RatingReview.context_choices:
#                 context = context_tuple[0]
#                 rate = int(request.POST['rating_%s' % context])
#                 if request.user.is_authenticated():
#                     review, created = RatingReview.objects.get_or_create(user=request.user, video=video,
#                                                                          context=context, defaults={'rate': rate})
#                     # if not new - must update the rate
#                     if not created:
#                         review.rate = rate
#                         review.save()
#                 else:
#                     key = 'has_rated' + str(video_id) + context
#                     if request.session.get(key, False):
#                         return HttpResponse(status=403, content=ugettext_lazy("You've already rated this video"))
#                     review = RatingReview.objects.create(user=None, video=video, context=context, rate=rate)
#                     request.session[key] = True
#         result = get_global_ratings(video)
#         return HttpResponse(status=201, content=json.dumps(result), content_type='application/json')
#     except Exception, e:
#         error_dict = dict(error=unicode(e))
#         return HttpResponse(status=400, content=json.dumps(error_dict), content_type='application/json')


def candidate_video_vote(request, candidate_video_id):
    key = 'rated_candidates'
    rated_candidates = request.session.get(key, [])
    if candidate_video_id in rated_candidates:
        return HttpResponse(status=403, content=ugettext_lazy("You've already rated this candidate video"))
    try:
        candidate_video = get_object_or_404(CandidateVideoPage, pk=candidate_video_id)
        if request.method == 'POST':
            vote = request.POST['vote']
            if vote == 'up':
                candidate_video.up_votes += 1
                request.session[key] = rated_candidates + [candidate_video_id]
            elif vote == 'down':
                candidate_video.down_votes += 1
                request.session[key] = rated_candidates + [candidate_video_id]
            elif vote == 'view':
                candidate_video.vote_views += 1
            candidate_video.save()
        return HttpResponse(status=201)
    except Exception as e:
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
            initial['title'] = video.video_title
            initial['link'] = 'http://www.youtube.com/watch?v=%s' % video.youtube_movie_id
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

            youtube_info = request_youtube_info(video_id=v.youtube_movie_id, part='snippet,contentDetails')['items'][0]
            v.youtube_channel = youtube_info['snippet']['channelTitle']
            v.video_description = youtube_info['snippet']['description'][:VideoPage.VIDEO_DESCRIPTION_LENGTH]
            v.video_upload_date = youtube_info['snippet']['publishedAt']
            v.video_duration = youtube_info['contentDetails']['duration']

            v.save()

            v.teach_item.purge_video_count()

            return HttpResponseRedirect(reverse('core:video_detail', kwargs=dict(video_id=v.id)))
        else:
            print form.errors

    root_topics = list(TeachTopic.objects.root_topics(for_teacher=False))
    root_subtree = list(itertools.chain.from_iterable(map(lambda topic: topic.get_subtree(), root_topics)))
    root_topics.extend(root_subtree)
    jstree_data = get_jstree_data(root_topics, None, opened=False, enable_items_only=True, include_video_count=False)
    return render(request, 'core/add_video.html', dict(form=form, jstree_data=json.dumps(jstree_data)))


def topic_view(request, topic_id):
    topic_qs = TeachTopic.objects.select_related('parent__parent__parent__parent')  # improve ancestor query
    try:
        topic = topic_qs.get(id=topic_id)
    except TeachTopic.DoesNotExist:
        raise Http404('No TeachTopic matches the given query.')

    topic_children = TeachTopic.objects.prefetch_related('teachtopic_set', 'teachitem_set').filter(
        parent=topic)  # improve teach topic children query
    item_children = TeachItem.objects.prefetch_related('videopage_set').filter(
        parent=topic)  # improve teach item children query

    for child in item_children:
        if child.entity_type == 'item' and child.video_count != child.videopage_set.count():
            child.purge_video_count()

    children = sorted(list(topic_children) + list(item_children), key=lambda x: x.order_index)
    breadcrumbs = topic.get_ancestry()
    ancestors = breadcrumbs[:-1]

    children_tuple = map(lambda x: (x, x.children(), len(x.children())), children)

    structured_data = {'@type': 'BreadcrumbList', 'itemListElement': get_ancestors_structured_data(breadcrumbs)}
    ld_json = json.dumps(structured_data, cls=DjangoJSONEncoder)

    return render(request, 'core/topic_view.html',
                  {'topic': topic, 'children': children_tuple, 'ancestors': ancestors, 'title': topic.title, 'ld_json': ld_json})


def item_view(request, item_id):
    item_qs = TeachItem.objects.select_related('parent__parent__parent__parent')  # improve ancestor query
    try:
        item = item_qs.get(id=item_id)
    except TeachItem.DoesNotExist:
        raise Http404('No TeachItem matches the given query.')

    videos = VideoPage.objects.filter(teach_item=item).select_related('user')

    if item.video_count != len(videos):
        item.purge_video_count()

    videos_dict = defaultdict(list)
    for v in videos:
        videos_dict[v.category].append(v)

    videos_list = [(ugettext_lazy(category + '_plural'), videos_dict[category]) for category in
                   VideoPage.CATEGORY_VALUES]

    breadcrumbs = item.get_ancestry()
    ancestors = breadcrumbs[:-1]

    structured_data = [{'@type': 'VideoGallery', 'video': map(get_video_structured_data, videos)},
                       {'@type': 'BreadcrumbList', 'itemListElement': get_ancestors_structured_data(breadcrumbs)}]
    ld_json = json.dumps(structured_data, cls=DjangoJSONEncoder)[1:-1]
    return render(request, 'core/item_view.html',
                  {'item': item, 'videos_list': videos_list, 'ancestors': ancestors, 'title': item.title, 'ld_json': ld_json})


def search(request):
    q = request.GET.get('q')
    if q:
        topics = TeachTopic.objects.prefetch_related('teachtopic_set', 'teachitem_set').filter(title__icontains=q)
        items = TeachItem.objects.prefetch_related('videopage_set').filter(title__icontains=q)
        children = sorted(list(topics) + list(items), key=lambda x: x.order_index)
        children_tuple = map(lambda x: (x, x.children(), len(x.children())), children)
        title = ugettext_lazy('Results for %(q)s') % {'q': q}
    else:
        children_tuple = []
        title = ugettext_lazy('Search page')

    return render(request, 'core/search.html',
                  {'children': children_tuple, 'title': title})


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
