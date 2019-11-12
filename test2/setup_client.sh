echo "Setting up $1..."
hostname $1
echo $1 > /etc/hostname
sudo cp /vagrant/clientconffile/rsyslog.conf /etc/rsyslog.conf
sudo systemctl start rsyslog
sudo systemctl enable rsyslog