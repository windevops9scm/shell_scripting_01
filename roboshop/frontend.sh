#!/bin/bash
LOG=/temp/roboshop.log
rm -f $LOG
echo -e "installing nginx\t\t...\e[32mdone\e[0m"
yum install nginx -y &>>LOG
echo -e "enabling nginx"
systemctl enable nginx &>>LOG
echo -e "starting nginx\t"
systemctl start nginx &>>LOG