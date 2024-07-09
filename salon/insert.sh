#! /bin/bash

DBNAME="salon"
PSQL="psql -X --username=freecodecamp --dbname=$DBNAME --tuples-only -c"

DROP=$($PSQL "DROP TABLE IF EXISTS customers CASCADE");
echo $DROP
DROP=$($PSQL "DROP TABLE IF EXISTS appointments");
echo $DROP
DROP=$($PSQL "DROP TABLE IF EXISTS services");

CREATE=$($PSQL "CREATE TABLE IF NOT EXISTS customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(15) UNIQUE NOT NULL,
  name VARCHAR(30) NOT NULL
)")
echo $CREATE

CREATE=$($PSQL "CREATE TABLE IF NOT EXISTS services(
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
)")
echo $CREATE

CREATE=$($PSQL "CREATE TABLE IF NOT EXISTS appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  service_id INT NOT NULL REFERENCES services(service_id),
  time VARCHAR(30) NOT NULL
)")
echo $CREATE

INSERT=$($PSQL "INSERT INTO services(name) VALUES ('cut')")
echo $INSERT

INSERT=$($PSQL "INSERT INTO services(name) VALUES ('color')")
echo $INSERT

INSERT=$($PSQL "INSERT INTO services(name) VALUES ('perm')")
echo $INSERT

INSERT=$($PSQL "INSERT INTO services(name) VALUES ('style')")
echo $INSERT

INSERT=$($PSQL "INSERT INTO services(name) VALUES ('trim')")
echo $INSERT


