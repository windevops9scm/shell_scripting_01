#!/bin/bash
source common.sh

PRINT "install nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STATUS_CHECK $?

PRINT "add roboshop application user"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
useradd roboshop &>>$LOG
fi
STATUS_CHECK $?

PRINT "Download catalogue code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
STATUS_CHECK $?
PRINT "extract downloaded code"
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>LOG && mv catalogue-main catalogue && cd /home/roboshop/catalogue && npm install
STATUS_CHECK $?
# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl restart catalogue
# systemctl enable catalogue