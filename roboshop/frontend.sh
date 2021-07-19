#!/bin/bash
LOG=/temp/roboshop.log
rm -f $LOG
echo -e "installing nginx\t\t..."
yum install nginx -y &>>LOG
if [ $? -eq 0 ]
then
echo -e "\e[32mdone\e[0m"
else
echo -e "\e[31mfail\e[0m"
fi

echo -e "enabling nginx"
systemctl enable nginx &>>LOG
echo -e "starting nginx\t"
systemctl start nginx &>>LOG