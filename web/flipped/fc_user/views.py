from django.core.urlresolvers import reverse
from django.shortcuts import render
import forms
from django.http.response import HttpResponseRedirect
from django.contrib.auth import login, authenticate


def register(request):
    if request.method == 'GET':
        register_form = forms.RegisterForm()
    elif request.method == 'POST':
        register_form = forms.RegisterForm(request.POST)
        if register_form.is_valid():
            from django.contrib.auth.models import User
            cd = register_form.cleaned_data;
            user = User.objects.create_user(cd['username'], cd['email'], cd['password'])
            user.first_name = cd['first_name']
            user.last_name = cd['last_name']
            user.save()
            user = authenticate(username=cd['username'], password=cd['password'])
            login(request, user)
            return HttpResponseRedirect('/common/home/')
    login_form = forms.AuthenticationForm()
    return render(request, 'fc_user/login_or_register.html', dict(register_form=register_form, login_form=login_form))
