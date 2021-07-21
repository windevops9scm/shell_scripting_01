#!/bin/bash
source common.sh

PRINT "install nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>LOG
STATUS_CHECK $?

PRINT "add roboshop application user"
useradd roboshop &>>LOG
STATUS_CHECK $?

PRINT "download "
$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
$ cd /home/roboshop
$ unzip /tmp/catalogue.zip
$ mv catalogue-main catalogue
$ cd /home/roboshop/catalogue
$ npm install


# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl restart catalogue
# systemctl enable catalogue