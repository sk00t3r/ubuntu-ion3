# Simple script for installing the iond 3.x.x daemon on Ubuntu.

# Please read all of the following carefully: 

This is for installing a **NEW** instance of the iond daemon. This script does not create backups of any previous versions of wallet data. Do not use this to upgrade from ion 2.0 wallets on the same system.

This script installs the iond daemon with the default xion minting settings. If you would like to change this you can edit the ioncoin.conf when the time comes.

enablezeromint="n" where 0=False and 1=True

zeromintpercentage="n" where "n" can not be less than 10

# Important note:

My code is completely open, but piping to python/bash can be dangerous. Please review the code.

**You may have to install some dependencies. To install run the following:**

apt-get install curl python-minimal python-tk -y

**Not all VPS hosting companines include the standard repositories. This step is only required if are getting the following errors:**

<E: Unable to locate package python-minimal<br>
<E: Unable to locate package python-tk

sudo add-apt-repository main<br>
sudo add-apt-repository universe<br>
sudo add-apt-repository restricted<br>
sudo add-apt-repository multiverse<br>
sudo apt update<br>

# To install iond run the following command:

python <(curl "https://gist.githubusercontent.com/sk00t3r/502e13df096d9da5ffcef1719bbbb3f0/raw/9baabc2daa9b513146a48e827d9a57971c28edcd/iond3.py" -s -N)

# Stopping the iond service:

ion-cli stop

# Useful ion-cli commands:

ion-cli getinfo

# For a list of all the ion-cli commands:

ion-cli help
