#!/usr/bin/env bash

add-apt-repository ppa:chris-lea/node.js
apt-get update

apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant/app /var/www

export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.5 mysql-server mysql-client

apt-get install -y php5 libapache2-mod-php5
apt-get install -y php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache 
apt-get install -y php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
apt-get install -y phpmyadmin
service apache2 restart

apt-get install -y software-properties-common
apt-get install -y python-software-properties python g++ make nodejs

rm -rf /usr/bin/node
ln -fs /usr/bin/nodejs /usr/bin/node 

npm install -g yo
npm install -g generator-webapp
npm install -g generator-angular 

