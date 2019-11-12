#!/bin/bash
hostname loggingserver
echo "loggingserver" > /etc/hostname
sudo cp /vagrant/serverconffile/rsyslog.conf /etc/
