#! /bin/bash

DBNAME="salon"
PSQL="psql -X --username=freecodecamp --dbname=$DBNAME --tuples-only -c"

MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\n~~~~~ MY SALON ~~~~~\n"
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  SERVICES
  read SERVICE_ID_SELECTED
  if [[ -z $SERVICE_ID_SELECTED ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_ID ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      PROCESS_ORDER $SERVICE_ID
    fi
  fi
}

SERVICES () {
  SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo $SERVICE_ID\) $SERVICE_NAME
  done
}

PROCESS_ORDER () {
  SERVICE_ID=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//')
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  fi

  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  if [[ "$INSERT_APPOINTMENT" = "INSERT 0 1" ]]
  then
    echo "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo some ERROR happened!!!
  fi
}


MAIN_MENU

