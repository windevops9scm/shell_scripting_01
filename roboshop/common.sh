#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
echo -e "\e[33myou should be a root/sudo user to run this script\e[0m"
exit 2
fi
LOG=/tmp/roboshop.log
rm -f $LOG

STATUS_CHECK() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mdone\e[0m"
  else
    echo -e "\e[31mfail\e[0m"
    echo -e "\e[33m check the log file for more details, Log file - $LOG  \e[0m"
    exit 1
  fi
}
PRINT() {
  echo -e "\n###########################\t$1\t###########################" &>>$LOG
  echo -n -e "$1\t\t..."
}
ADD_APPLICATION_USER() {
PRINT "add roboshop application user \t"
id roboshop &>>$LOG
 if [ $? -ne 0 ]; then
    useradd roboshop &>>$LOG
 fi
STATUS_CHECK $?
}

DOWNLOAD_APP_CODE()
{
  PRINT "Download application code\t"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>$LOG
STATUS_CHECK $?
PRINT "extract downloaded code"
cd /home/roboshop && unzip -o /tmp/${COMPONENT}.zip &>>$LOG && rm -rf ${COMPONENT} && mv ${COMPONENT}-main ${COMPONENT}
STATUS_CHECK $?
}
PERM_FIX() {
  PRINT "Fix Application Permissions"
chown roboshop:roboshop /home/roboshop -R &>>$LOG
STATUS_CHECK $?
}
SETUP_SYSTEMD() {
  PRINT "setup systemd file \t"
#sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.robpshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" -e "s/CARTENDPOINT/cart.roboshop.internal/"  -e 's/DBHOST/mysql.roboshop.internal/' -e 's/CARTHOST/cart.roboshop.internal/' -e 's/USERHOST/user.roboshop.internal/' -e 's/AMQPHOST/rabbitmq.roboshop.internal/' /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" -e 's/CARTENDPOINT/cart.roboshop.internal/' -e 's/DBHOST/mysql.roboshop.internal/' -e 's/CARTHOST/cart.roboshop.internal/' -e 's/USERHOST/user.roboshop.internal/' /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
STATUS_CHECK $?

PRINT "start ${COMPONENT} service\t "
systemctl daemon-reload &>>$LOG && systemctl restart ${COMPONENT} &>>$LOG && systemctl enable ${COMPONENT} &>>$LOG
STATUS_CHECK $?
}

NODEJS() {
PRINT "install nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STATUS_CHECK $?

ADD_APPLICATION_USER
DOWNLOAD_APP_CODE

PRINT "install nodejs dependencies"
cd /home/roboshop/${COMPONENT} && npm install --unsafe-perm &>>$LOG
STATUS_CHECK $?
PERM_FIX
SETUP_SYSTEMD
}

JAVA() {
  PRINT "Install Maven\t\t"
  yum install maven -y &>>$LOG
  STATUS_CHECK $?

  ADD_APPLICATION_USER
  DOWNLOAD_APP_CODE

  PRINT "Compile Code\t\t"
  cd /home/roboshop/${COMPONENT} && mvn clean package &>>$LOG &&  mv target/shipping-1.0.jar shipping.jar
  STATUS_CHECK $?

  PERM_FIX
  SETUP_SYSTEMD
}
PYTHON3() {
  PRINT "Install python3 \t\t "
  yum install python36 gcc python3-devel -y &>>$LOG
  STATUS_CHECK $?

  ADD_APPLICATION_USER
  DOWNLOAD_APP_CODE

PRINT "Install python dependencies"
cd /home/roboshop/${COMPONENT} &>>$LOG && pip3 install -r requirements.txt &>>$LOG
STATUS_CHECK $?

  PERM_FIX
  #SETUP_SYSTEMD

}

# mv /home/roboshop/payment/systemd.service /etc/systemd/system/payment.service
# systemctl daemon-reload
# systemctl enable payment
# systemctl start payment   payment.ini