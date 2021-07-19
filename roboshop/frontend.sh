#!/bin/bash
LOG=/temp/roboshop.log
rm -f $LOG

Status_check()
{
  if [ $? -eq 0 ]
then
echo -ne "\e[32mdone\e[0m"
else
echo -ne "\e[31mfail\e[0m"
exit 1
fi
}

echo -n -e "installing nginx\t\t..."
yum install nginx -y &>>LOG
Status_check $?


echo -ne "enabling nginx\t\t"
systemctl enable nginx &>>LOG
Status_check $?


echo -ne "starting nginx\t\t"
systemctl start nginx &>>LOG
Status_check $?

