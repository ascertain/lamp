#!/bin/bash
# export DEBIAN_FRONTEND=noninteractive
echo 'UPDATE'
sudo add-apt-repository ppa:jon-severinsson/ffmpeg
sudo apt-get update
sudo apt-get -q -y install wget
sudo apt-get -q -y install apache2
sudo apt-get -q -y install mysql-server
sudo apt-get -q -y install php5 libapache2-mod-php5
sudo apt-get -q -y install unzip
sudo apt-get -q -y install php5-mysql
sudo apt-get -q -y install php5-gd
sudo apt-get -q -y install libgd2-xpm-dev*
sudo apt-get -q -y install ffmpeg
sudo apt-get -q -y install frei0r-plugins
sudo apt-get -q -y install phpmyadmin

