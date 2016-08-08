import floppyforms as forms
from django.utils.translation import ugettext_lazy as _
import django.contrib.auth.forms as auth_forms


class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30, required=True, label=_('username'))
    password = forms.CharField(max_length=10, required=True, label=_('password'), widget=forms.PasswordInput)
    email = forms.EmailField(required=True, label=_('email'))
    first_name = forms.CharField(max_length=30, required=True, label=_('first_name'))
    last_name = forms.CharField(max_length=30, required=True, label=_('last_name'))


class AuthenticationForm(auth_forms.AuthenticationForm):
    username = forms.CharField(max_length=254, required=True)
    password = forms.CharField(label=_("Password"), widget=forms.PasswordInput, required=True)
