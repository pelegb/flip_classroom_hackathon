rm -f db.sqlite3
python manage.py syncdb --noinput

export DJANGO_SETTINGS_MODULE='flipped.settings'
export PYTHONPATH=`pwd`
python common/reset.py




