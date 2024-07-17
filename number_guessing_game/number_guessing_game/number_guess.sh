#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

GUESS () {
  NO_TO_GUESS=$((($RANDOM % 1000) + 1))
  GUESS=-1
  TRIES=0
  echo Guess the secret number between 1 and 1000:
  while [[ $NO_TO_GUESS -ne $GUESS ]]
  do
    TRIES=$(($TRIES + 1))
    read GUESS
    GUESS=$(echo $GUESS | grep -E '^[0-9]+$')
    if [[ $GUESS ]]
    then
      if [[ $GUESS -gt $NO_TO_GUESS ]]
      then
        echo It\'s lower than that, guess again:
      else
        if [[ $GUESS -lt $NO_TO_GUESS ]]
        then
          echo It\'s higher than that, guess again:
        else
          if [[ $GUESS -eq $NO_TO_GUESS ]]
          then
            INSERT_GUESS=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES ($USER_ID, $TRIES)")
            echo You guessed it in $TRIES tries. The secret number was $NO_TO_GUESS. Nice job!
          else
            echo Some error happened.
          fi
        fi
      fi
    else
      echo That is not an integer, guess again:
    fi
  done
}

echo Enter your username:
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE LOWER(username) = LOWER('$USERNAME')")
if [[ $USER_ID ]]
then
  GAME_QUERY=$($PSQL "SELECT COUNT(*), MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID")
  read NO_OF_GAMES BAR MIN_GUESS <<< $GAME_QUERY
  if ! [[ $MIN_GUESS ]]
  then
    NO_OF_GAMES=0
    MIN_GUESS=0
  fi
  echo Welcome back, $USERNAME! You have played $NO_OF_GAMES games, and your best game took $MIN_GUESS guesses.

else
  INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  echo Welcome, $USERNAME! It looks like this is your first time here.
fi

GUESS
