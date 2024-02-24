#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"
SERVICES_MENU() {
if [[ $1 ]]
then
echo -e "\n$1"
fi
echo "$($PSQL "SELECT service_id, name FROM services")" | sed 's/ |/)/;s/ *//'
read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
SERVICES_MENU "Please enter a valid number. What would you like today?"
else
SERVICE=$(echo "$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")" | sed -E 's/^ *| *$//g')
if [[ -z $SERVICE ]]
then
SERVICES_MENU "I could not find that service. What would you like today?"
else
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
if [[ -z $CUSTOMER_ID ]]
then
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
INSERT_CUSTOMER_RESULT="$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")"
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
else
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID ;")
CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
fi
echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME
SERVICE_TIME=$(echo $SERVICE_TIME | sed -E 's/^ *| *$//g')
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
if [[ INSERT_APPOINTMENT_RESULT=="INSERT 0 1" ]]
then
echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME.\n"
fi
fi
fi
}
SERVICES_MENU
