#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
echo -e "\e[33myou should be a root/sudo user to run this script\e[0m"
exit 2
fi
LOG=/tmp/roboshop.log
rm -f $LOG

STATUS_CHECK() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mdone\e[0m"
  else
    echo -e "\e[31mfail\e[0m"
    echo -e "\e[33m check the log file for more details, Log file - $LOG  \e[0m"
    exit 1
  fi
}
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo -n -e "$1\t\t..."
}

