#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -X --tuples-only -c"
echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How may I help you?"
  echo -e "\n1) cut\n2) color\n3) wash\n4) exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SERVICE_NAME="cut"   ;;
    2) SERVICE_NAME="color" ;;
    3) SERVICE_NAME="wash"  ;;
    4) EXIT                 ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac

  SCHEDULE
}

SCHEDULE(){
  # Pide teléfono
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Busca customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

  if [[ -z $CUSTOMER_ID ]]
  then
    # Nuevo cliente: pide nombre e inserta
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  else
    # Cliente existente: obtiene nombre
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID;")
  fi

  # Pide hora
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Inserta la cita
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

  # Confirmación
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  exit
}

EXIT(){
  echo -e "\nThank you for stopping in.\n"
  exit
}

MAIN_MENU