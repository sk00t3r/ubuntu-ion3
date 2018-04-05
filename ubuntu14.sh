#!/bin/bash

echo "#### Installing Sudo ####"
echo " "
apt-get install sudo -y
clear
echo "#### Stopping iond ####"
echo " "
ion-cli stop
echo "### Removing old iond"
echo " "
rm -rf /usr/bin/iond
rm -rf /usr/local/bin/iond
rm -rf /root/ion
echo "#### Changing to home directory ####"
echo " "
cd ~/
clear
echo "#### Adding Bitcoin PPA ####"
apt-get install software-properties-common -y
add-apt-repository ppa:bitcoin/bitcoin -y
#sudo add-apt-repository ppa:ionomy/ioncoin
clear
echo "#### Updating Ubuntu ####"
echo " "
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get update -y
clear
echo "#### Installing Dependencies ####"
echo " "
apt-get install software-properties-common -y 
apt-get install automake -y 
apt-get install libevent-dev -y
apt-get install libminiupnpc-dev -y
apt-get install miniupnpc -y
apt-get install libzmq3-dev -y
apt-get install libevent-dev -y
apt-get install libgmp-dev -y
apt-get install libboost-all-dev -y
apt-get install libdb4.8-dev -y
apt-get install python-software-properties -y 
apt-get install git -y 
apt-get install build-essential -y
apt-get install libtool -y 
apt-get install autotools-dev -y
apt-get install autoconf -y
apt-get install pkg-config -y
apt-get install libssl-dev -y
apt-get install libcrypto++-dev -y
apt-get install libdb4.8++-dev -y
apt-get install zip -y
clear
echo "#### Downloading iond Core ####"
echo " "
git clone https://github.com/ioncoincore/ion
clear
echo "#### Creating ion folder ####"
echo " "
mkdir ~/.ioncoin/
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
wget https://raw.githubusercontent.com/sk00t3r/ubuntu-iond3/master/ioncoin.conf -O ioncoin.conf
nano ioncoin.conf
mv ioncoin.conf ~/.ioncoin/ioncoin.conf
clear
echo "#### Changing to /usr/local/bin ####"
echo " "
cd /usr/local/bin
echo "#### Starting the iond service ####"
echo " "
echo "#### Type" "ion-cli stop" "to quit iond ####"
iond
