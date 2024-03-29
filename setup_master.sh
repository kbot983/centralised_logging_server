#!/bin/bash
hostname loggingserver
echo "loggingserver" > /etc/hostname
sudo yum -y install httpd php php-mysql wget
sudo systemctl enable httpd && systemctl start httpd
sudo yum install mariadb-server -y rsyslog-mysql
sudo systemctl enable mariadb && systemctl start mariadb
mysql -u root -p < /usr/share/doc/rsyslog-8.24.0/mysql-createDB.sql
sudo cp /vagrant/serverconffile/rsyslog.conf /etc/
