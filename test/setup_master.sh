#!/bin/bash
hostname loggingserver
echo "loggingserver" > /etc/hostname
sudo cp /home/vagrant/rsyslogconf/rsyslog.conf /etc/rsyslog.conf
sudo systemctl start rsyslog
sudo systemctl enable rsyslog
sudo systemctl status rsyslog