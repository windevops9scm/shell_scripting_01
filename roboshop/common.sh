#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
echo -e "\e[33myou should be a root/sudo user to run this script\e[0m"
exit 2
fi

STATUS_CHECK()
{
  if [ $? -eq 0 ]
then
echo -e "\e[32mdone\e[0m"
else
echo -e "\e[31mfail\e[0m"
exit 1
fi
}
PRINT()
{
  echo -n -e "$1\t\t..."
}

