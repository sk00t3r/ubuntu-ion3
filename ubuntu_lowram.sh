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
clear
echo "#### Updating Ubuntu ####"
echo " "
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get update -y
clear
echo "#### Creating Swap ####"
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s
echo "/swapfile none swap sw 0 0" >> /etc/fstab
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
echo -n "Would you like to use the default config settings (xion minting enabled at 10%) [Y/n]? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
clear
echo "#### Generating ioncoin config file with default settings ####"
config="ioncoin.conf"
touch $config
randUser=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
randPass=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
echo "rpcuser=$randUser" > $config
echo "rpcpassword=$randPass" >> $config
echo "rpcallowip=127.0.0.1" >> $config
echo "rpcport=12705" >> $config
echo "port=12700" >> $config
echo "listen=1" >> $config
echo "server=1" >> $config
echo "server=1" >> $config
echo "daemon=1" >> $config
echo "debug=0" >> $config
echo "zeromintpercentage=10" >> $config
echo "enablezeromint=1" >> $config
else
echo "#### Generating ioncoin config file with minting xion disabled ####"
config="ioncoin.conf"
touch $config
randUser=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
randPass=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
echo "rpcuser=$randUser" > $config
echo "rpcpassword=$randPass" >> $config
echo "rpcallowip=127.0.0.1" >> $config
echo "rpcport=12705" >> $config
echo "port=12700" >> $config
echo "listen=1" >> $config
echo "server=1" >> $config
echo "server=1" >> $config
echo "daemon=1" >> $config
echo "debug=0" >> $config
echo "zeromintpercentage=10" >> $config
echo "enablezeromint=0" >> $config
fi
echo "#### Setting iond to run on boot ####"
ionStart="/root/ionStart.sh"
touch $ionStart
echo "#!/bin/sh" > $ionStart
echo " " >> $ionStart
echo "echo "$(date +%F_%T) Starting iond miner: $(date)"" >> $ionStart
echo "/usr/local/bin/iond" >> $ionStart
echo "echo "$(date +%F_%T) Waiting 15 seconds "" >> $ionStart
echo "sleep 15" >> $ionStart
(crontab -l ; echo "@reboot sh /root/ionStart.sh >> /root/ionStart.log 2>&1")| crontab -
echo "#### Changing to /usr/local/bin ####"
echo " "
cd /usr/local/bin
echo "#### Starting the iond service ####"
echo " "
echo "#### Type" "ion-cli stop" "to quit iond ####"
iond
