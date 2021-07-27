#!/bin/bash
source common.sh

PRINT "Install Erlang \t"
yum list installed | grep erlang &>>$LOG
if [ $? -ne 0 ]; then
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y &>>$LOG
fi
STATUS_CHECK $?

PRINT "Setup Rabbitmq repos\t"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>$LOG
STATUS_CHECK $?

PRINT "Install Rabbitmq server\t"
yum install rabbitmq-server -y &>>$LOG
STATUS_CHECK $?

PRINT "Start Rabbitmq service \t"
systemctl enable rabbitmq-server &>>$LOG && systemctl start rabbitmq-server &>>$LOG
STATUS_CHECK $?

PRINT "Create app user in Rabbitmq\t"
sudo rabbitmqctl list_users | grep roboshop &>>$LOG
if [ $? -ne 0 ]; then
  rabbitmqctl add_user roboshop roboshop123 &>>$LOG
fi
rabbitmqctl set_user_tags roboshop administrator &>>$LOG && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$LOG
STATUS_CHECK $?
