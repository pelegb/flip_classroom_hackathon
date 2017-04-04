#!/bin/sh
NEW_RELIC_CONFIG_FILE=%(HOME)s/newrelic.ini
export NEW_RELIC_CONFIG_FILE
export HOME=%(HOME)s

cd %(DJANGO_BASE_DIR)s
exec newrelic-admin run-program gunicorn -p %(HOME)s/flipped.id \
    -b 127.0.0.1:9000 \
    -w 2 flipped.wsgi:application
 
