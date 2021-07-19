#!/bin/bash
source common.sh

LOG=/temp/roboshop.log
rm -f $LOG

print "installing nginx"
yum install nginx -y &>>LOG
Status_check $?

print "enabling nginx"
systemctl enable nginx &>>LOG
Status_check $?

print "starting nginx"
systemctl start nginx &>>LOG
Status_check $?

