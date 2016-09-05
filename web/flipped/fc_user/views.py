from django.core.urlresolvers import reverse
from django.shortcuts import render
import forms
from django.http.response import HttpResponseRedirect
from django.contrib.auth import login, authenticate
from django.contrib.auth.models import User


def register(request):
    if request.method == 'GET':
        register_form = forms.RegisterForm()
        next = request.GET.get('next')
    elif request.method == 'POST':
        register_form = forms.RegisterForm(request.POST)
        if register_form.is_valid():
            cd = register_form.cleaned_data;
            user = User.objects.create_user(cd['username'], cd['email'], cd['password'])
            user.first_name = cd['first_name']
            user.last_name = cd['last_name']
            user.save()
            user = authenticate(username=cd['username'], password=cd['password'])
            login(request, user)
            if 'next' in register_form.data:
                return HttpResponseRedirect(register_form.data['next'])
            else:
                return HttpResponseRedirect(reverse('home'))
        print register_form.errors
        next = request.POST.get('next')
    login_form = forms.AuthenticationForm()
    return render(request, 'fc_user/login_or_register.html',
                  dict(register_form=register_form, login_form=login_form, next=next))
