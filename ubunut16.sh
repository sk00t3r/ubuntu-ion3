#!/bin/bash

echo "#### Installing Sudo ####"
echo " "
apt-get install sudo -y
clear
echo "#### Stopping iond ####"
echo " "
ion-cli stop
echo "#### Change to home directory ####"
echo " "
cd ~/
clear
echo "#### Adding Bitcoin PPA ####"
sudo add-apt-repository ppa:bitcoin/bitcoin
#sudo add-apt-repository ppa:ionomy/ioncoin
clear
echo "#### Updating Ubuntu ####"
echo " "
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get update -y
clear
echo "#### Installing Dependencies ####"
echo " "
sudo apt-get install software-properties-common -y 
sudo apt-get install automake -y 
sudo apt-get install libevent-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install miniupnpc -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libevent-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libdb4.8-dev -y
sudo apt-get install python-software-properties -y 
sudo apt-get install git -y 
sudo apt-get install build-essential -y
sudo apt-get install libtool -y 
sudo apt-get install autotools-dev -y
sudo apt-get install autoconf -y
sudo apt-get install pkg-config -y
sudo apt-get install libssl-dev -y
sudo apt-get install libcrypto++-dev -y
sudo apt-get install libdb4.8++-dev -y
sudo apt-get install zip -y
clear
echo "#### Downloading iond Core ####"
echo " "
git clone https://github.com/ionomy/ion
clear
echo "#### Installing iond service ####"
echo " "
cd ion
./autogen.sh
./configure
make
make install
cd ~/.ioncoin/
  clear
  echo "#### Please set a username and password, the password should be long and random ####"
  echo "#### Ctrl + X, Y, Enter to save file and exit ####"
  echo " "
  read -p "#### Press any key when you are ready to continue ####"
  echo " "
  wget https://raw.githubusercontent.com/sk00t3r/linux-ion/rebase/ioncoin.conf -O ioncoin.conf
  nano ioncoin.conf
  mv ioncoin.conf ~/.ioncoin/ioncoin.conf
fi
clear
echo "#### Changing to /usr/local/bin ####"
echo " "
cd /usr/local/bin
echo "#### Starting the iond service ####"
echo " "
echo "#### Type" "ion-cli stop" "to quit iond ####"
iond&