#!bin/bash

# create /var

# create 30G /VAR
sudo lvcreate -L 30G -n VAR vgKVM

# create ext4 for /VAR
sudo mkfs.ext4 /dev/mapper/vgKVM-VAR

# save after reboot
sudo sh -c "echo '/dev/mapper/vgKVM-VAR /VAR ext4 defaults 0 0' >> /etc/fstab"

# mount /VAR
cd /
sudo mkdir VAR
sudo mount /dev/mapper/vgKVM-VAR /VAR

# create swapfile

# create 4G swapfile (swp)
sudo fallocate -l 4G /swp
sudo chmod 600 /swp

# create filesystem
sudo mkswap /swp

# activate swp
sudo swapon /swp

# save after reboot
echo '/swp none swap sw 0 0' | sudo tee -a /etc/fstab