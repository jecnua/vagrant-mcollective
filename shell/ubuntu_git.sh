#!/bin/bash

GIT_VERSION='2.3.7'

##Decent git
cd /opt/
sudo apt-get remove git
sudo apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libexpat1-dev gettext

#wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
#tar xzf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
./configure --without-tcltk
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo 'export PATH=$PATH:/usr/local/git/bin' >> /etc/profile
