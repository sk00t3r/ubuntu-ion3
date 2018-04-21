# Simple script for installing the iond 3.x.x daemon on Ubuntu.

# Please read all of the following carefully: 

This is for installing a **NEW** instance of the iond daemon. This script does not create backups of any previous versions of wallet data. Do not use this to upgrade from ion 2.0 wallets on the same system.

This script asks if you want the iond daemon to start with the default xion minting settings (xion minting at 10%). If you would like to disable the minting of xion select No to using the default ioncoin config file. If you would like to edit the settings the ioncoin.config file run:

nano ~/.ioncoin/ioncoin.config -- Ctrl + X will ask to save changes. Press Y then Enter to write changes to the file and exit the editor.

enablezeromint="n" where 0=False and 1=True

zeromintpercentage="n" where "n" can not be less than 10

# Important note:

My code is completely open, but piping to python/bash can be dangerous. Please review the code.

**You may have to install some dependencies. To install run the following:**

apt-get install curl python-minimal python-tk -y

**Not all VPS hosting companines include the standard repositories. This step is only required if are getting the following errors:**

<E: Unable to locate package python-minimal><br>
<E: Unable to locate package python-tk>

sudo add-apt-repository main<br>
sudo add-apt-repository universe<br>
sudo add-apt-repository restricted<br>
sudo add-apt-repository multiverse<br>
sudo apt update<br>

# To install iond run the following command:

python <(curl "https://gist.githubusercontent.com/sk00t3r/502e13df096d9da5ffcef1719bbbb3f0/raw/20b8e57a17388c9e8484f115ce70f2a055e3b4b3/iond3.py" -s -N)

# Stopping the iond service:

ion-cli stop

# Useful ion-cli commands:

ion-cli getinfo

# For a list of all the ion-cli commands:

ion-cli help
