#!/bin/bash
source common.sh

LOG=/temp/roboshop.log
rm -f $LOG

print "installing nginx"
yum install nginx -y &>>LOG
Status_check $?

print "Download frontend"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>LOG
Status_check $?
print "Remove old HTDOCS"
cd /usr/share/nginx/html && rm -rf * &>>LOG
Status_check $?
PRINT "Extract frontend archive"
unzip /tmp/frontend.zip &>>LOG && mv frontend-main/* .&>>LOG && mv static/* . &>>LOG&& rm -rf frontend-master static &>>LOG
Status_check $?
print "update robosho config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>LOG
Status_check $?

print "enabling nginx  "
systemctl enable nginx &>>LOG
Status_check $?

print "starting nginx  "
systemctl restart nginx &>>LOG
Status_check $?


