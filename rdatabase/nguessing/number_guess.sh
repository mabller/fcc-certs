#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generar número secreto aleatorio entre 1 y 1000
SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

# Contador de intentos
NUMBER_OF_GUESSES=0

MAIN_MENU() {
  echo "Enter your username:"
  read USERNAME

  # Buscar si el usuario existe
  USERNAME_SEARCH=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  if [[ -z $USERNAME_SEARCH ]]; then
    # Usuario nuevo
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    # Insertar usuario en tabla users
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    # Obtener nuevo user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  else
    # Usuario existente: obtener estadísticas
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID" | xargs)
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID" | xargs)
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo "Guess the secret number between 1 and 1000:"
  GAME
}

GAME() {
  read GUESS
  # Validar que sea entero
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    GAME
  else
    (( NUMBER_OF_GUESSES++ ))

    if (( GUESS > SECRET_NUMBER )); then
      echo "It's lower than that, guess again:"
      GAME
    elif (( GUESS < SECRET_NUMBER )); then
      echo "It's higher than that, guess again:"
      GAME
    else
      # Usuario adivinó el número
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      # Guardar resultado en la tabla games
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
      exit
    fi
  fi
}

MAIN_MENU
