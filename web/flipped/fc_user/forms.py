import floppyforms as forms
from django.utils.translation import ugettext_lazy as _
class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30,required=True,label=_('username'))
    password = forms.CharField(max_length=10,required=True,label=_('password'))
    email = forms.EmailField(required=True,label=_('email'))
    first_name = forms.CharField(max_length=30,required=True,label=_('first_name'))
    last_name = forms.CharField(max_length=30,required=True,label=_('last_name'))
    

    

    