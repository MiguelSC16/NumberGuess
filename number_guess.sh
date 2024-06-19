#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

NUMBER=$(( RANDOM % 1000 + 1 ))

GUESSES=$((0 + 0))

echo $NUMBER

LOGIN(){
  echo Enter your username:
  read USERNAME
  USER_INFO=$($PSQL "SELECT *FROM users WHERE username = '$USERNAME'")
  if [[ -z $USER_INFO ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  else
    echo $USER_INFO | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
    do
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses. 
    done
  fi
  echo Guess the secret number between 1 and 1000:
  GAME $USERNAME
}

GAME(){
  USERNAME=$1
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    GAME $USERNAME
  else
    GUESSES=$(( $GUESSES + 1 ))
    if (( $GUESS > $NUMBER ))
    then
      echo "It's lower than that, guess again:"
      GAME $USERNAME
    elif (( $GUESS < $NUMBER ))
    then
      echo "It's higher than that, guess again:"
      GAME $USERNAME
    else
      echo You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!
      UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
      BEST_SCORE=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
      if (( GUESSES < BEST_SCORE ))
      then
        UPDATE_BEST_SCORE_RESULT=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE username = '$USERNAME'")
      fi
    fi
  fi
}

LOGIN
