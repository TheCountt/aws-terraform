#!/bin/bash
sudo yum install  https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo yum install htop -y
sudo yum install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
sudo yum update -y
sudo yum install mysql wget vim telnet chrony git python3 net-tools -y
sudo yum module reset php -y
sudo yum module enable php:remi-7.4 -y
sudo yum install php php-common php-xml php-json php-mbstring php-opcache php-gd php-curl php-mysqlnd -y

# install apache
sudo dnf install httpd -y

# selinux config
sudo setsebool -P httpd_can_network_connect=1
sudo setsebool -P httpd_can_network_connect_db=1
sudo setsebool -P httpd_execmem=1
sudo setsebool -P httpd_use_nfs=1

# installing efs-utils
sudo git clone https://github.com/aws/efs-utils /efs-utils/
cd /efs-utils
sudo yum install make -y
sudo yum install rpm-build -y
sudo make rpm
sudo yum install ./build/amazon-efs-utils*rpm -y

#installing java 11
sudo yum install java-11-openjdk-devel -y
sudo echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" >> ~/.bash_profile
sudo echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bash_profile
sudo echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" >> ~/.bash_profile
source ~/.bash_profile

#installing self signed certificate for apache(httpd)
sudo yum install mod_ssl -y

sudo openssl req -newkey rsa:2048 -nodes -keyout /etc/pki/tls/private/ACS.key -x509 -days 365 -out /etc/pki/tls/certs/ACS.crt \
-subj "/C=UK/ST=London/L=London/O=darey.io/OU=devops/CN=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname)"


sudo sed -i 's/localhost.crt/ACS.crt/g'  /etc/httpd/conf.d/ssl.conf

sudo sed -i 's/localhost.key/ACS.key/g'  /etc/httpd/conf.d/ssl.conf

#start and enable php-fpm
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

sudo systemctl start httpd
sudo systemctl enable httpd