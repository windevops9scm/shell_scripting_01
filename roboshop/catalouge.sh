#!/bin/bash
source common.sh

PRINT "install nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STATUS_CHECK $?

PRINT "add roboshop application user"
useradd roboshop
STATUS_CHECK $?


# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl restart catalogue
# systemctl enable catalogue