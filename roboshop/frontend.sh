#!/bin/bash
LOG=/temp/roboshop.log
rm -f $LOG
echo -n -e "installing nginx\t\t..."
yyum install nginx -y &>>LOG
if [ $? -eq 0 ]
then
echo -e "\e[32mdone\e[0m"
else
echo -e "\e[31mfail\e[0m"
fi

echo -e "enabling nginx"
systemctl enable nginx &>>LOG
if [ $? -eq 0 ]
then
echo -n -e "\e[32mdone\e[0m"
else
echo -n -e "\e[31mfail\e[0m"
fi

echo -e "starting nginx\t"
systemctl start nginx &>>LOG
if [ $? -eq 0 ]
then
echo -n -e "\e[32mdone\e[0m"
else
echo -n -e "\e[31mfail\e[0m"
fi
