#!bin/bash

# mount cdrom
sudo mount /dev/cdrom /media

# going to media dir
cd /media

# install all packages
sudo dpkg --install *

# checking the installation
echo -en "\033[37;1;41m net-tools status: \033[0m"
sudo dpkg --status net-tools  | head -2

echo -en "\033[37;1;41m bird status: \033[0m"
sudo dpkg --status bird | head -2

echo -en  "\033[37;1;41m lldp status: \033[0m"
sudo dpkg --status lldp | head -2

echo -en  "\033[37;1;41m openssh-server status: \033[0m"
sudo dpkg --status openssh-server | head -2

# unmount cdrom
sudo umount -l /media