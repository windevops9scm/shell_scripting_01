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

PRINT "Download catalogue code\t"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STATUS_CHECK $?
PRINT "extract downloaded code"
STATUS_CHECK $?
PRINT "install nodejs dependencies"
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>$LOG && rm -rf catalogue && mv catalogue-main catalogue && cd /home/roboshop/catalogue && npm install --unsafe-perm &>>$LOG
STATUS_CHECK $

PRINT "Fix Application Permissions"
chown roboshop:roboshop /home/roboshop -R
STAT_CHECK $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl restart catalogue
# systemctl enable catalogue