from django import forms
class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30,required=True)
    password = forms.CharField(max_length=10,required=True)
    email = forms.EmailField(required=True)
    first_name = forms.CharField(max_length=30,required=True)
    last_name = forms.CharField(max_length=30,required=True)
    
    
    

    