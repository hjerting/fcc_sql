#! /bin/bash

sudo cp ./.freeCodeCamp/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo chown -R postgres:postgres /var/lib/postgresql/12/main
sudo service postgresql restart
echo "SELECT 'CREATE USER freecodecamp WITH CREATEDB' WHERE NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='freecodecamp')\gexec" | psql -U postgres -X

# Change 'dbname' in 3 places to whatever database name is used
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'dbname'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE dbname"

# Connect to the database
psql --username=freecodecamp --dbname=dbname