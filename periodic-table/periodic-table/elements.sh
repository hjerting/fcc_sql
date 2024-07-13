# /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


if [[ $1 ]]
then
  NUMBER=$(echo $1 | grep -E '^[0-9]+$')
  if [[ $NUMBER ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE LOWER(symbol) = LOWER('$1') OR LOWER(name) = LOWER('$1')")
  fi
  if [[ $ATOMIC_NUMBER ]]
  then
    ELEMENT_QUERY=$($PSQL "SELECT symbol, name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    read SYMBOL BAR NAME <<< $ELEMENT_QUERY
    PROPERTIES_QUERY=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    read TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS <<< $PROPERTIES_QUERY
    echo The element with atomic number $ATOMIC_NUMBER is $NAME \($SYMBOL\). It\'s a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius.
  else
    echo I could not find that element in the database.
  fi
else
  echo Please provide an element as an argument.
fi