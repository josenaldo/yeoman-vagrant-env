#!/usr/bin/env bash

apt-get update
add-apt-repository ppa:chris-lea/node.js
apt-get update

apt-get install -y build-essential openssl libreadline6 libreadline6-dev
apt-get install -y curl
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
apt-get install -y git
apt-get install -y ruby
apt-get install -y apache2
apt-get install -y php5 libapache2-mod-php5
apt-get install -y php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache 
apt-get install -y php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
apt-get install -y phpmyadmin
apt-get install -y software-properties-common
apt-get install -y python-software-properties python g++ make nodejs
apt-get install -y libjpeg-turbo-progs optipng
service apache2 restart

export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.5 mysql-server mysql-client


rm -rf /var/www
ln -fs /vagrant/app /var/www

ln -fs /usr/bin/nodejs /usr/bin/node 

mkdir /tmp/node_modules
ln -s /tmp/node_modules /vagrant/node_modules
chmod -R 777 /tmp/node_modules/

gem update --system
gem install compass
gem install sass

npm install -g yo
npm install -g phantomjs
npm install -g generator-webapp
npm install -g generator-angular
npm install -g http-server
npm install -g karma
npm install -g protractor
npm install -g karma-jasmine 
npm update -g

