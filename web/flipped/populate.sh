#!/bin/bash

cat populate.sql | sqlite3 db.sqlite3

if [[ $? -ne 0 ]];
then
    printf "\nERROR!\nYou should probably run 'reset.sh' first.\n"
fi