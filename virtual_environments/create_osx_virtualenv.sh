#!/bin/bash

DIR=env_osx
rm -rf $DIR
virtualenv --no-site-packages $DIR
source $DIR/bin/activate
pip install -r osx_requirements.txt
pip freeze
deactivate
