#!/bin/bash
source ~/pg_password.sh
mkdir -p ~/db_backup
pg_dump flipped -U flipped -h localhost > ~/db_backup/db_dump.sql
s3cmd put ~/db_backup/db_dump.sql s3://open-class/db_dump.sql
