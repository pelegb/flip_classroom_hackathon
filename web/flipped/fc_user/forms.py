from django import forms
class RegisterForm(forms.Form):
    username = forms.CharField(max_length=30)
    password = forms.CharField(max_length=10)
    email = forms.EmailField()
    
    

    