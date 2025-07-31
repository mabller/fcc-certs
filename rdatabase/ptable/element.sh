#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Search by atomic_number, symbol or name
if [[ $1 =~ ^[0-9]+$ ]]; then
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
    FROM elements e 
    JOIN properties p USING(atomic_number) 
    JOIN types t USING(type_id) 
    WHERE e.atomic_number = $1")
else
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
    FROM elements e 
    JOIN properties p USING(atomic_number) 
    JOIN types t USING(type_id) 
    WHERE e.symbol = INITCAP('$1') OR e.name = INITCAP('$1')")
fi

if [[ -z $RESULT ]]; then
  echo "I could not find that element in the database."
else
  IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
fi
