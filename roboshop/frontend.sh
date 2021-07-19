#!/bin/bash
source common.sh

LOG=/temp/roboshop.log
rm -f $LOG

print "installing nginx"
yum install nginx -y &>>LOG
Status_check $?

print "  enabling nginx "
systemctl enable nginx &>>LOG
Status_check $?

print "  starting nginx  "
systemctl start nginx &>>LOG
Status_check $?

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
echo -e "\e you should be a root/sudo user to run this script"
exit 2
fi

