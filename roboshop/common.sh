#!/bin/bash

Status_check()
{
  if [ $? -eq 0 ]
then
echo -e "\e[32mdone\e[0m"
else
echo -e "\e[31mfail\e[0m"
exit 1
fi
}
print()
{
  echo -n -e "$1\t\t..."
}