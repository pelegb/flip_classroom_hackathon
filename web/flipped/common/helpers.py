from django.contrib.auth.models import User
def create_superuser():
    User.objects.create_superuser('flip','flip@klum.com','flip')
    
    
