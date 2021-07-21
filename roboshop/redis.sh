#!/bin/bash
source common.sh
PRINT "install redis repos"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STATUS_CHECK $?

PRINT "install redis\t"
yum install redis -y --enablerepo=remi &>>$LOG
STATUS_CHECK $?

PRINT "update redis listen address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf
STATUS_CHECK $?

PRINT "start redis service\t\t"
systemctl enable redis &>>$LOG && systemctl restart redis &>>$LOG
STATUS_CHECK $?
