# /bin/bash

PATTERN="^[0-9]+$"

VARIABLE="1"

echo VARIABLE = \"$VARIABLE\"
if [[ VARIABLE =~ $PATTERN ]]
then
    echo $VARIABLE is a number
else
    echo $VARIABLE is NOT a number
fi

VARIABLE=1

echo VARIABLE = $VARIABLE
if [[ VARIABLE =~ '^[0-9]+$' ]]
then
    echo $VARIABLE is a number
else
    echo $VARIABLE is NOT a number
fi

IS_NUMBER=$(echo $VARIABLE | grep -E '^[0-9]+$')
echo $IS_NUMBER ?