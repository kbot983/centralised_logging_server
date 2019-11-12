#!/bin/bash
hostname loggingserver
echo "loggingserver" > /etc/hostname
sudo cp /vagrant/serverconffile/rsyslog.conf /etc/
mkdir /home/vagrant/rsyslog 
sudo systemctl start rsyslog
sudo systemctl enable rsyslog
sudo systemctl status rsyslog