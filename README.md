# Installing the iond 3.x.x wallet on Ubuntu.

# Note: 

My code is completely open, but piping to python/bash can be dangerous. Please review the code.

# You may have to install some dependencies. To install run the following:

apt-get install curl python-minimal python-tk -y

# To install iond run the following command:

python <(curl "https://gist.githubusercontent.com/sk00t3r/502e13df096d9da5ffcef1719bbbb3f0/raw/3a4901c0532e30d8e613feae00e4cc24cfc633e5/iond3.py" -s -N)

# Stopping the iond service:

ion-cli stop

# For a list of all the ion-cli commands:

ion-cli help
