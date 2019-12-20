#!/bin/bash
hostname loggingserver
echo "loggingserver" > /etc/hostname
sudo yum -y install httpd php php-mysql wget
sudo systemctl enable httpd && systemctl start httpd
sudo yum install mariadb-server -y rsyslog-mysql
sudo enable mariadb && systemctl start mariadb


sudo cp /vagrant/serverconffile/rsyslog.conf /etc/
