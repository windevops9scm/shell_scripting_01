#!/bin/bash
source common.sh

PRINT "Setup MySQL Repos\t"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STATUS_CHECK $?

PRINT "Install MySQL\t\t"
yum install mysql-community-server -y &>>$LOG
STATUS_CHECK $?

PRINT "start MySQL\t\t"
systemctl enable mysqld &>>$LOG && systemctl start mysqld &>>$LOG
STATUS_CHECK $?

PRINT "reset MySQL default password\t\t"
DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" | mysql --connect-expired-password -uroot -p${DEFAULT_PASSWORD} &>>$LOG
STATUS_CHECK $?

