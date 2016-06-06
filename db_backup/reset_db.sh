#!/bin/bash
export  PGPASSWORD=flipped
dropdb flipped -U flipped --if-exists $@
createdb flipped -U flipped $@
psql -f db_dump.sql -U flipped $@ # Restore the dumped data to the newly created DB

