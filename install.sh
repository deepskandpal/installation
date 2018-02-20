#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root"
 exit 1
else
 #Update and Upgrade
 echo "Updating and Upgrading"
 apt-get update && sudo apt-get upgrade -y
fi

 #Install apt-fast
 echo "Installing apt-fast"
 add-apt-repository ppa:apt-fast/stable
 apt-get update
 apt-get -y install apt-fast

#Installing curl
 echo "Installing curl"
 apt-fast install  curl

 #Install Nodejs
 echo "Installing Nodejs"
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 apt-fast install -y nodejs

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
  apt-fast install -y automake
  apt-fast install -y build-essential
  apt-fast install -y pkg-config
  apt-fast install -y libevent-dev
  apt-fast install -y libncurses5-dev

 rm -fr /tmp/tmux

 git clone https://github.com/tmux/tmux.git /tmp/tmux

 cd /tmp/tmux

 sh autogen.sh

 ./configure && make

 sudo make install

 cd -

 rm -fr /tmp/tmux

 #Installing atom
 echo "Installing atom"
 sudo add-apt-repository ppa:webupd8team/atom
 sudo apt-fast update; sudo apt-fast install atom

 #Installing truffle
  echo "Installing truffle"
  npm install -g truffle

 #Installing ganache
 echo "Installing ganache"
 cd ~/deepanshu/Download
 echo "Cloning repository"
 git clone https://github.com/trufflesuite/ganache.git; cd ganache
 echo "Building from source"
 npm install
 npm start
 npm run build-linux
 
