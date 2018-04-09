from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
import django.contrib.auth.forms as auth_forms


def unique_username(value):
    if User.objects.filter(username=value).count() > 0:
        raise ValidationError(_(u'User already exists: %(value)s') % {'value': value})


class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30, required=True, label=_('username'), validators=[unique_username])
    password = forms.CharField(max_length=10, required=True, label=_('password'), widget=forms.PasswordInput)
    email = forms.EmailField(required=True, label=_('email'))
    first_name = forms.CharField(max_length=30, required=True, label=_('first_name'))
    last_name = forms.CharField(max_length=30, required=True, label=_('last_name'))


class AuthenticationForm(auth_forms.AuthenticationForm):
    username = forms.CharField(max_length=30, required=True)
    password = forms.CharField(max_length=10, required=True, label=_('password'), widget=forms.PasswordInput)
