#!/bin/bash
LOG=/temp/roboshop.log
rm -f $LOG

Status_check()
{
  if [ $? -eq 0 ]
then
echo -e "\e[32mdone\e[0m"
else
echo -e "\e[31mfail\e[0m"
exit 1
fi
}
print()
{
  echo -n -e"$1\t\t..."
}

print "installing nginx\t\t..."
yum install nginx -y &>>LOG
Status_check $?


print "enabling nginx\t\t"
systemctl enable nginx &>>LOG
Status_check $?


print "starting nginx\t\t"
systemctl start nginx &>>LOG
Status_check $?

