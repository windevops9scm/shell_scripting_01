#!/bin/bash
echo -e "installing nginx\t\t...\e[31mdone\e[0m"
yum install nginx -y
echo -e "enabling nginx"
systemctl enable nginx
echo -e "starting nginx\t"
systemctl start nginx