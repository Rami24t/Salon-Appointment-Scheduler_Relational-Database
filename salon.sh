#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Create salon database structure and insert 5 rows into services
# in any other database => CREATE DATABASE salon; and then
# Drop tables if they exist
# $($PSQL "DROP TABLE services, customers, appointments");
# Connect to the salon database and create necessary tables if not exist
# psql --username=freecodecamp --dbname=salon <<EOF
# 
# -- Create customers table
# CREATE TABLE IF NOT EXISTS customers (
#     customer_id SERIAL PRIMARY KEY,
#     name VARCHAR,
#     phone VARCHAR UNIQUE
# );
# -- Create services table
# CREATE TABLE IF NOT EXISTS services (
#     service_id SERIAL PRIMARY KEY,
#     name VARCHAR
# );
# -- Create appointments table
# CREATE TABLE IF NOT EXISTS appointments (
#     appointment_id SERIAL PRIMARY KEY,
#     customer_id INT REFERENCES customers(customer_id),
#     service_id INT REFERENCES services(service_id),
#     time VARCHAR
# );
# 
#  -- Insert data into services table
#  INSERT INTO services (name) VALUES
#     ('cut'),
#     ('color'),
#     ('perm'),
#     ('style'),
#     ('trim')
# EOF

# Print Top Banner
echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"
# Services Menu - Service Selection Screen
SERVICES_MENU() {
# Show text argument if provided
if [[ $1 ]]
then
echo -e "\n$1"
fi
# Show services menu and recieve selection
echo "$($PSQL "SELECT service_id, name FROM services")" | sed 's/ |/)/;s/ *//'
read SERVICE_ID_SELECTED
# if not valid
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
# go back if selection is invalid and show proper message
SERVICES_MENU "Please enter a valid number. What would you like today?"
else

# valid selection
SERVICE=$(echo "$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")" | sed -E 's/^ *| *$//g')

# if not found
if [[ -z $SERVICE ]]
# go back and show a proper message
then
SERVICES_MENU "I could not find that service. What would you like today?"
else
# service_id is found

# collect customer info (customer_phone and customer_name)
# get customer_phone to identify old customer or add new one
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
# check if already exists by getting their id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
# get customer_name
# if no customer with input phone was found
if [[ -z $CUSTOMER_ID ]]
then
# ask for customer_name (get name from standard input)
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
# add the new customer and get new customer_id
INSERT_CUSTOMER_RESULT="$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")"
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
else
# customer_phone found ie customer data already exists
# get customer_name from database
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID ;")
CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')

fi

# make appointment
# get required appointment time
echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME
SERVICE_TIME=$(echo $SERVICE_TIME | sed -E 's/^ *| *$//g')
# rem echo $SERVICE_TIME | grep -E [0-2][0-9]:[0-5][0-9] --color?
# rem return if invalid?
# rem if [[ ! $SERVICE_TIME =~ [0-2][0-9]:[0-5][0-9] ]]?
# rem then?
# rem SERVICES_MENU "Please enter valid input. What would you like today?"?
# rem fi?
# make an appointment for the customer with the chosen service
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
# show appointment making info
if [[ INSERT_APPOINTMENT_RESULT=="INSERT 0 1" ]]
then
echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME.\n"
fi

fi
fi
}

SERVICES_MENU
