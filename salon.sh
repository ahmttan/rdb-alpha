#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ -z $1 ]]
  then
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo -e "$1"
  fi

  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services")

  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "\nI could not find that service. What would you like today?"
    else
      APPOINTMENT $SERVICE_ID_SELECTED $SERVICE_NAME
      
    fi
  fi


}



APPOINTMENT(){
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
if [[ ! $CUSTOMER_PHONE =~ ^[0-9\-]+$ ]]
then
  echo "Wrong enterring"
  APPOINTMENT $1 $2
else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    while [[ -z $CUSTOMER_NAME ]]
    do
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    done
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  while [[ -z $SERVICE_TIME ]]
  do
    echo -e "\nWhat time would you like your $2, $CUSTOMER_NAME?"
    read SERVICE_TIME
  done

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ($CUSTOMER_ID,$1,'$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then 
    echo -e "\nI have put you down for a $2 at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi

fi
}




MAIN_MENU