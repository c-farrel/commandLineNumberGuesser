@echo off
rem create title of game, set game colors, and initalize varibles
title [Guess the Number!]
color 02
set /a numGuess=0
set /a answerEasy=0
set /a answerMedium=0
set /a answerHard=0
set /a answerExtreme=0
set /a userChoice=0
rem display instructions for game
:Instructions
echo This is a simple number guessing game.
echo You will be able to pick if from three difficulties
echo.
pause

rem Display the game menu and get user menu choice
:Menu
cls
rem set/reset random numbers and numGuess
set /a answerEasy=(%RANDOM%*10/32768)+1
set /a answerMedium=(%RANDOM%*100/32768)+1
set /a answerHard=(%RANDOM%*1000/32768)+1
set /a numGuess=1
rem extract 1 digit from 9 random numbers to generate a random 9 digit number
set /a answerExtreme=%random:~-1%%random:~-1%%random:~-1%%random:~-1%%random:~-1%%random:~-1%%random:~-1%%random:~-1%%random:~-1%
echo 1. Easy - Guess a number between 1 and 10
echo 2. Medium - Guess a number between 1 and 100
echo 3. Hard - Guess a number between 1 and 1000
echo 4. Extreme - Guess a random 9 digit number
echo 5. Exit Game
echo Enter your menu choice
set /p userChoice=
if %userChoice%==1 goto Easy
if %userChoice%==2 goto Medium
if %userChoice%==3 goto Hard
if %userChoice%==4 goto Extreme
if %userNumber%==5 goto Exit
echo %userChoice% is not a vaid menu option, please enter again.
echo.
pause
goto Menu

rem user wants to guess a number between 1 and 10
:Easy
rem get user guess
echo Guess a number bewteen 1 and 10
echo Enter your guess
set /p userGuess=
rem compare user guess to answer
if %userGuess% GTR %answerEasy% echo Lower!
if %userGuess% LSS %answerEasy% echo Higher!
if %userGuess%==%answerEasy% goto Equal
set /a numGuess=numGuess+1
goto Easy

rem user wants to guess a number between 1 and 100
:Medium
rem get user guess
echo Guess a number between 1 and 100
echo Enter your guess
set /p userGuess=
rem compare user guess to answer
if %userGuess% GTR %answerMedium% echo Lower!
if %userGuess% LSS %answerMedium% echo Higher!
if %userGuess%==%answerMedium% goto Equal
set /a numGuess=numGuess+1
goto Medium

rem user wants to guess a number between 1 and 1000
:Hard
rem get user guess
echo Guess a number between 1 and 1000
echo Enter your guess
set /p userGuess=
rem compare user guess to answer
if %userGuess% GTR %answerHard% echo Lower!
if %userGuess% LSS %answerHard% echo Higher!
if %userGuess%==%answerHard% goto Equal
set /a numGuess=numGuess+1
goto Hard

rem user wants to guess a random 9 digit number
:Extreme
rem get user guess
echo Guess a 9 digit number
echo Enter your guess
set /p userGuess=
rem compare user guess to answer
if %userGuess% GTR %answerExtreme% echo Lower!
if %userGuess% LSS %answerExtreme% echo Higher!
if %userGuess%==%answerExtreme% goto Equal
set /a numGuess=numGuess+1
goto Extreme

rem user wants to exit program
:Exit
cls
echo Thanks for Guessing!
pause
exit /b

rem User correctly guesses number
:Equal
cls
echo Congratulations, you guessed the number correctly!
echo The number was: 
if %userChoice%==1 echo %answerEasy%
if %userChoice%==2 echo %answerMedium%
if %userChoice%==3 echo %answerHard%
if %userChoice%==4 echo %answerExtreme%
echo It took you %numGuess% attempts.
pause
goto Menu

