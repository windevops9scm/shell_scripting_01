#!/bin/bash
source common.sh

PRINT "Install Erlang \t"
yum list installed | grep erlang &>>$LOG
if [ $? -ne 0 ]; then
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y &>>$LOG
fi
STATUS_CHECK $?
#curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
# yum install rabbitmq-server -y

# systemctl enable rabbitmq-server
# systemctl start rabbitmq-server

# rabbitmqctl add_user roboshop roboshop123
# rabbitmqctl set_user_tags roboshop administrator
# rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

#create rabbitmq dns