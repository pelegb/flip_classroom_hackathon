#!/bin/sh

cd %(DJANGO_BASE_DIR)s
exec gunicorn -p %(HOME)s/flipped.id \
    -b 127.0.0.1:9000 \
    -w 2 flipped.wsgi:application
 
