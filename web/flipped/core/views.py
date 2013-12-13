from django.shortcuts import render, get_object_or_404
from models import VideoPage

# Create your views here.

def video_detail(request, video_id):
    video = get_object_or_404(VideoPage, pk=video_id)
    return render(request, 'core/video_detail.html', {'video': video})