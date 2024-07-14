#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=postgres --tuples-only -c"
CREATE_DATABASE=$($PSQL "CREATE DATABASE number_guess")
echo $CREATE_DATABSE

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

CREATE_USER_TABLE=$($PSQL "CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22) UNIQUE NOT NULL
)")
echo $CREATE_USER_TABLE

CREATE_GAMES_TABLE=$($PSQL "CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  number_of_guesses INTEGER,
  user_id INTEGER NOT NULL REFERENCES users(user_id)
)")

psql --username=freecodecamp --dbname=number_guess
