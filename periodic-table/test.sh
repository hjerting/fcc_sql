# /bin/bash

VARIABLE="1"

echo VARIABLE = \"$VARIABLE\"
if [[ VARIABLE =~ '^[0-9]+$' ]]
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

# My workaround
echo ""

VARIABLE="1"
echo VARIABLE = \"$VARIABLE\"
IS_NUMBER=$(echo $VARIABLE | grep -E '^[0-9]+$')
if [[ IS_NUMBER ]]
then
    echo $VARIABLE is a number
else
    echo $VARIABLE is NOT a number
fi

VARIABLE=1
echo VARIABLE = $VARIABLE
IS_NUMBER=$(echo $VARIABLE | grep -E '^[0-9]+$')
if [[ IS_NUMBER ]]
then
    echo $VARIABLE is a number
else
    echo $VARIABLE is NOT a number
fi

