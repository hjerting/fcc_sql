ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1 OR symbol = '$1' OR name = '$1'")
  if [[ $ATOMIC_NUMBER ]]
  then
    echo ATOMIC_NUMBER FOUND: \'$ATOMIC_NUMBER\'
  else
    echo ATOMIC_NUMBER NOT FOUND!