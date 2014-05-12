#!/usr/bin/env bash

#################################################################################### 
# ADD NEW REPOSITORIES 
#################################################################################### 
apt-get update
apt-get install -y software-properties-common python-software-properties
add-apt-repository ppa:chris-lea/node.js
add-apt-repository ppa:webupd8team/java
apt-get update

#################################################################################### 
# INSTALL BASE PACKAGES
#################################################################################### 
apt-get install -y build-essential openssl libreadline6 libreadline6-dev
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
apt-get install -y g++ make 
apt-get install -y curl
apt-get install -y git

#################################################################################### 
# INSTALL PYTHON PACKAGES
#################################################################################### 
apt-get install -y python 

#################################################################################### 
# INSTALL RUBY PACKAGES
#################################################################################### 
apt-get install -y ruby

#################################################################################### 
# INSTALL JAVASCRIPT PACKAGES
#################################################################################### 
apt-get install -y nodejs

#################################################################################### 
# INSTALL PHP PACKAGES
####################################################################################
apt-get install -y apache2
export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.5 mysql-server mysql-client
apt-get install -y php5 libapache2-mod-php5
apt-get install -y php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache 
apt-get install -y php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
apt-get install -y phpmyadmin
apt-get install -y libjpeg-turbo-progs optipng pngquant
service apache2 restart

#################################################################################### 
# INSTALL JAVA PACKAGES
#################################################################################### 
apt-get install -y openjdk-7-jdk

#################################################################################### 
# UPDATE SYSTEM
#################################################################################### 
apt-get update -y
apt-get upgrade -y

#################################################################################### 
# CONFIGURE PROJECT DIRETORIES
#################################################################################### 
mkdir -p /vagrant/code/frontend/app
mkdir -p /vagrant/code/backend
mkdir -p /home/vagrant/node_modules
chmod -R 777 /home/vagrant/node_modules/
rm -rf /var/www
rm -f /usr/bin/ant
rm -f /usr/bin/mvn
rm -f /usr/bin/gradle
ln -fs /vagrant/code/frontend/app /var/www
ln -fs /usr/bin/nodejs /usr/bin/node 
ln -s /home/vagrant/node_modules /vagrant/code/frontend/node_modules

#################################################################################### 
# INSTALL FRONTEND TOOLING
#################################################################################### 
gem update --system
gem install compass
gem install sass

npm install -g yo
npm install -g yo phantomjs
npm install -g generator-webapp
npm install -g generator-angular
npm install -g http-server
npm install -g lodash
npm install -g useragent
npm install -g karma
npm install -g grunt-karma
npm install -g karma-jasmine 
npm install -g protractor
npm install -g phantomjs
npm update -g

#################################################################################### 
# INSTALL BACKEND TOOLING
####################################################################################

##### MAVEN
wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz
tar -xzf apache-maven-3.2.1-bin.tar.gz 
cp -R apache-maven-3.2.1 /opt
ln -s /opt/apache-maven-3.2.1/bin/mvn /usr/bin/mvn
sh -c "cat > /etc/profile.d/maven.sh" <<'EOF'
export M2_HOME=/opt/apache-maven-3.2.1/
export PATH=$PATH:$M2_HOME/bin
EOF

##### ANT
wget http://ftp.unicamp.br/pub/apache//ant/binaries/apache-ant-1.9.4-bin.tar.gz
tar -xzf apache-ant-1.9.4-bin.tar.gz
cp -R apache-ant-1.9.4 /opt
ln -s /opt/apache-ant-1.9.4/bin/ant /usr/bin/ant
sh -c "cat > /etc/profile.d/ant.sh" <<'EOF'
export ANT_HOME=/opt/apache-ant-1.9.4/
export PATH=$PATH:$ANT_HOME/bin
EOF

##### GRADLE
wget https://services.gradle.org/distributions/gradle-1.12-bin.zip
unzip gradle-1.12-bin.zip -d /opt
ln -s /opt/gradle-1.12/bin/gradle /usr/bin/gradle
sh -c "cat > /etc/profile.d/ant.sh" <<'EOF'
export GRADLE_HOME=/opt/gradle-1.12/
export PATH=$PATH:$GRADLE_HOME/bin
EOF