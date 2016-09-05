#!/bin/bash
export  PGPASSWORD=password
psql  -U postgres $@ -c "DROP USER IF EXISTS flipped; CREATE USER flipped WITH CREATEDB PASSWORD 'flipped';"
