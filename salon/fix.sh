#! /bin/bash

sudo cp ./.freeCodeCamp/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo chown -R postgres:postgres /var/lib/postgresql/12/main
sudo service postgresql restart
echo "SELECT 'CREATE USER freecodecamp WITH CREATEDB' WHERE NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname='freecodecamp')\gexec" | psql -U postgres -X

DBNAME="postgres"
PSQL="psql -X --username=freecodecamp --dbname=$DBNAME --tuples-only -c"

NEW_DATABASE=$($PSQL "CREATE DATABASE salon")
echo $NEW_DATABASE

./insert.sh

psql --username=freecodecamp --dbname=salon