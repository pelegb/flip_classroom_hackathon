set PGPASSWORD=flipped
"C:\Program Files\PostgreSQL\9.3\bin\dropdb.exe" -U flipped flipped
"C:\Program Files\PostgreSQL\9.3\bin\createdb.exe" -U flipped flipped
"C:\Program Files\PostgreSQL\9.3\bin\psql.exe" -f db_dump.sql -U flipped
"C:\Program Files\PostgreSQL\9.3\bin\psql.exe" -U flipped -c "update auth_user set password = 'pbkdf2_sha256$12000$XjfZhaPr5Zmw$6SagJxGUXduCK2uQS05iefFcBnZFUi4GghzxJKWeYI0='" flipped

