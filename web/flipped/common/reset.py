from django.contrib.auth.models import User
def create_superuser():
    User.objects.create_superuser('flip','flip@klum.com','flip')
    
if __name__ == '__main__':
    create_superuser()


