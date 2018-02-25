#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root"
 exit 1
else
 #Update and Upgrade
 echo "Updating and Upgrading"
 apt-get update
fi

 #Install apt-fast
 echo "Installing apt-fast"
 add-apt-repository ppa:apt-fast/stable
 apt-get update
 apt-get -y install apt-fast
 
 #Installing Zsh and oh my ZSH
  sudo apt-fast install zsh
  chsh -s /bin/zsh  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
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

 #updating and  upgrading using apt-fast
 echo "updating and upgrading"
 apt-fast   update && apt-fast  upgrade
 
 #Installing chrome stable
 echo "Installing Chrome"
 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
 echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list 
 sudo apt-fast update
 sudo apt-get install google-chrome-stable 
 
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
  
  cd 
  wget "https://raw.githubusercontent.com/deepskandpal/dot-files/master/.tmux.conf"

 
#Installing atom
 echo "Installing atom"
 sudo add-apt-repository ppa:webupd8team/atom
 sudo apt-fast update; sudo apt-fast install atom

 #Installing truffle
  echo "Installing truffle"
  npm install -g truffle

 #Installing ganache
# echo "Installing ganache"
# cd ~/Downloads
# echo "Cloning repository"
# git clone https://github.com/trufflesuite/ganache.git; cd ganache
# echo "Building from source"
# npm install
# npm start
# npm run build-linux
   
#Installing MAC ubuntu 
 echo "Installing Mac ubuntu"
  add-apt-repository ppa:noobslab/macbuntu
  apt-fast update
  apt-fast install macbuntu-os-icons-lts-v7
  apt-fast install macbuntu-os-ithemes-lts-v7
  apt-fast install albert
  apt-fast install unity-tweak-tool

