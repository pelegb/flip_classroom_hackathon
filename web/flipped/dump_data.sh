#!/bin/bash

python manage.py dumpdata \
	--indent 4 \
	--exclude sessions.session > data.json


