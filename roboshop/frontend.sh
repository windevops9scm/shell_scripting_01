#!/bin/bash
source common.sh

PRINT "installing nginx\t"
yum install nginx -y &>>$LOG
STATUS_CHECK $?

PRINT "Download frontend\t"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
STATUS_CHECK $?
PRINT "Remove old HTDOCS\t"
cd /usr/share/nginx/html && rm -rf * &>>$LOG
STATUS_CHECK $?
PRINT "Extract frontend archive"
unzip /tmp/frontend.zip &>>$LOG && mv frontend-main/* . &>> $LOG && mv static/* . &>>$LOG && rm -rf frontend-master static &>>$LOG
STATUS_CHECK $?

PRINT "copy roboshop config\t"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
STATUS_CHECK $?

PRINT "update roboshop config\t"
#sed -i -e '/catalogue/ s/localhost/catalogue.roboshop.internal/' -e '/user/ s/localhost/user.roboshop.internal/' -e '/cart/ s/localhost/cart.roboshop.internal/' -e '/shipping/ s/localhost/shipping.roboshop.internal/' /etc/nginx/default.d/roboshop.conf
sed -i -e '/catalogue/ s/localhost/catalogue.roboshop.internal/' -e '/user/ s/localhost/user.roboshop.internal/'  -e '/cart/ s/localhost/cart.roboshop.internal/' -e '/shipping/ s/localhost/shipping.roboshop.internal/' -e '/payment/ s/localhost/payment.roboshop.internal/' /etc/nginx/default.d/roboshop.conf
STATUS_CHECK $?

PRINT "enabling nginx \t\t"
systemctl enable nginx &>>$LOG
STATUS_CHECK $?

#PRINT "starting nginx/t/t/t "
#systemctl restart nginx &>>LOG
#STATUS_CHECK $?



