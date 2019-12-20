sudo su
cd /tmp
wget http://download.adiscon.com/loganalyzer/loganalyzer-4.1.5.tar.gz
tar -xzvf loganalyzer-4.1.5.tar.gz

sudo mkdir /var/www/html/loganalyzer
cp -r /tmp/loganalyzer-4.1.5/src/* /var/www/html/loganalyzer
cp -r /tmp/loganalyzer-4.1.5/contrib/* /var/www/html/loganalyzer

cp /vagrant/serverconffile/config.php /var/www/html/loganalyzer/
cd /var/www/html/loganalyzer
chown apache:apache config.php
chmod 777 config.php
chcon -h -t httpd_sys_script_rw_t /var/www/html/loganalyzer/config.php
exit 