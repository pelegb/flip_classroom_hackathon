from django.shortcuts import render_to_response
from django.template.context import RequestContext

# Create your views here.

def home(request):
    return render_to_response('common/home.html',context_instance=RequestContext(request))

