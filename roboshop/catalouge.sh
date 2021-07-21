#!/bin/bash
source common.sh

PRINT "install nodejs\t"
yum install nodejs make gcc-c++ -y &>>LOG
STATUS_CHECK $?

PRINT "add roboshop application user"
useradd roboshop &>>LOG
STATUS_CHECK $?