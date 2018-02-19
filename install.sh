#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root"
 exit 1
else
 #Update and Upgrade
 echo "Updating and Upgrading"
 apt-get update && sudo apt-get upgrade -y
fi

 #Installing curl 
 echo "Installing curl"
 apt install  curl

 #Install Nodejs
 echo "Installing Nodejs"
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 apt install -y nodejs

#Install apt-fast
echo"Installing apt-fast"
 add-apt-repository ppa:apt-fast/stable
 apt-get update
 apt-get -y install apt-fast

#Install git 
echo "Installing git "
apt-fast install git

#updatin and  upgrading using apt-fast
echo "updating and upgrading"
apt-fast   update && apt-fast  upgrade

#Tmux installation and configuration
echo "Installing Tmux"
sudo apt update

#sudo apt install -y git
echo "Installing build essentials"
sudo apt-fast install -y automake
sudo apt-fast install -y build-essential
sudo apt-fast install -y pkg-config
sudo apt-fast install -y libevent-dev
sudo apt-fast install -y libncurses5-dev

rm -fr /tmp/tmux

git clone https://github.com/tmux/tmux.git /tmp/tmux

cd /tmp/tmux

sh autogen.sh

./configure && make

sudo make install

cd -

rm -fr /tmp/tmux
