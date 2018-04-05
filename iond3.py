#!/usr/bin/python

import platform
import subprocess
import urllib
import os

distro = platform.linux_distribution()[0]
version = platform.linux_distribution()[1]
name =  platform.linux_distribution()[2]
mem_bytes = os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES')
mem = mem_bytes/(1024.**3)

def iond():
        if version == "14.04" and mem >= 4 or version == "16.04" and mem >= 4 or version == "16.10" and mem >= 4or version == "17.04" and mem >= 4 or version == "17.10" and mem >= 4:
                urllib.urlretrieve ("https://raw.githubusercontent.com/sk00t3r/ubuntu-iond3/master/ubuntu.sh", "ubuntu.sh")
                os.chmod('ubuntu.sh', 0755)
                subprocess.call("./ubuntu.sh", shell=True)
                
        elif version == "14.04" or version == "16.04" or version == "16.10" or version == "17.04" or version == "17.10":
                urllib.urlretrieve ("https://raw.githubusercontent.com/sk00t3r/ubuntu-iond3/master/ubuntu_lowram.sh", "ubuntu_lowram.sh")
                os.chmod('ubuntu_lowram.sh', 0755)
                subprocess.call("./ubuntu_lowram.sh", shell=True)
           
        else:
                print("Sorry version not yet supported.")
                
iond()
