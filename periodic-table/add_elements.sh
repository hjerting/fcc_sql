# /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

cat new_elements.txt | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
do
  if [[ "$ATOMIC_NUMBER" == "atomic_number" ]]
  then
    echo Skipping header
  else
    echo \'$ATOMIC_NUMBER\' \'$NAME\'

    # get TYPE_ID
    TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
    if [[ -z $TYPE_ID ]]
    then
      echo TYPE_ID NOT FOUND
      INSERT=$($PSQL "INSERT INTO types(type) VALUES('$TYPE')")
      echo $INSERT
      TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
      echo TYPE inserted TYPE_ID = \'$TYPE_ID\'
    else
      echo TYPE_ID FOUND: \'$TYPE_ID\'
    fi

    # insert element into elements
    INSERT=$($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES($ATOMIC_NUMBER, '$SYMBOL', '$NAME')")
    echo $INSERT

    #insert property into properties
    INSERT=$($PSQL "INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES($ATOMIC_NUMBER, '$TYPE', $ATOMIC_MASS, $MELTING_POINT_CELSIUS, $BOILING_POINT_CELSIUS, $TYPE_ID)")
    echo $INSERT
  fi
done