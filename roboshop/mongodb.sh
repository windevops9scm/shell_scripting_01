#!/bin/bash
source common.sh
PRINT "set up mongodb repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STATUS_CHECK $?

PRINT "install mongodb \t"
yum install -y mongodb-org &>>LOG
STATUS_CHECK $?

PRINT "Update MongoDB Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STATUS_CHECK $?

PRINT " start mongodb service\t"
systemctl enable mongod &>>LOG && systemctl start mongod &>>LOG
STATUS_CHECK $?

PRINT "download mongodb schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>LOG
STATUS_CHECK $?

PRINT " load mongodb schema\t"
cd /tmp && unzip -o mongodb.zip &>>LOG && cd mongodb-main && mongo < catalogue.js &>>LOG && mongo < users.js &>>LOG
STATUS_CHECK $?