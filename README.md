# Installing the iond 3.x.x wallet on Ubuntu.

# Please read all of the following carefully: 

This is for installing a **NEW** instance of the iond service. This script does create backups of any wallet data (yet). Do not use this to upgrade from ion 2.0 wallets.

My code is completely open, but piping to python/bash can be dangerous. Please review the code.

**You may have to install some dependencies. To install run the following:**

apt-get install curl python-minimal python-tk -y

# To install iond run the following command:

python <(curl "https://gist.githubusercontent.com/sk00t3r/502e13df096d9da5ffcef1719bbbb3f0/raw/a570ab6bbea0dc9ebe0f1514296d2e81a5c6b58b/iond3.py" -s -N)

# Stopping the iond service:

ion-cli stop

# Useful ion-cli commands:

ion-cli getinfo

# For a list of all the ion-cli commands:

ion-cli help
