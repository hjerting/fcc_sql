#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

QUERY_RESULT=$($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE elements ADD CONSTRAINT unique_symbol UNIQUE (symbol)")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE elements ADD CONSTRAINT unique_name UNIQUE (name)")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties
    ADD CONSTRAINT atomic_number_fk FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number)")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "DROP TABLE types")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "CREATE TABLE types(
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(30) UNIQUE NOT NULL
)")
echo $QUERY_RESULT

PROPERTIES=$($PSQL "SELECT DISTINCT type FROM properties")
echo "$PROPERTIES" | while read PROPERTY
do
  echo $PROPERTY
  INSERT=$($PSQL "INSERT INTO types(type) VALUES('$PROPERTY')")
done

QUERY_RESULT=$($PSQL "ALTER TABLE properties ADD type_id INT")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "SELECT atomic_number, type FROM properties")
echo "$QUERY_RESULT" | while read ATOMIC_NUMBER BAR TYPE
do
  echo \'$ATOMIC_NUMBER\' \'$TYPE\'
  TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
  if [[ -z $TYPE_ID ]]
  then
    echo Type \'$TYPE\' NOT found!
  else
    UPDATE=$($PSQL "UPDATE properties SET type_id = $TYPE_ID WHERE type = '$TYPE'")
    echo $UPDATE
  fi
done

QUERY_RESULT=$($PSQL "ALTER TABLE properties
    ADD CONSTRAINT type_id_fk FOREIGN KEY (type_id) REFERENCES types (type_id)")
echo $QUERY_RESULT

QUERY_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL")
echo $QUERY_RESULT

DROP_COLUMN=$($PSQL "ALTER TABLE properties DROP COLUMN type")
echo $DROP_COLUMN

SYMBOLS=$($PSQL "SELECT symbol FROM elements")
echo "$SYMBOLS" | while read SYMBOL
do
  CAPITALIZED_SYMBOL=${SYMBOL^}
  echo $CAPITALIZED_SYMBOL
  UPDATE=$($PSQL "UPDATE elements SET symbol = '$CAPITALIZED_SYMBOL' WHERE symbol = '$SYMBOL'")
  echo $UPDATE
done

ALTER=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL")
echo $ALTER

DELETE=$($PSQL "DELETE FROM properties WHERE atomic_number = 1000")
echo $DELETE

DELETE=$($PSQL "DELETE FROM elements WHERE atomic_number = 1000")
echo $DELETE

./add_elements.sh