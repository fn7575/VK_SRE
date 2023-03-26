#!bin/bash

# create users
sudo useradd -m -U d.alexeev
sudo useradd -m -U s.ivannikov

# grant sudo group for users
usermod -a -G sudo d.alexeev
usermod -a -G sudo s.ivannikov

# create password for users
sudo echo "d.alexeev:d.alexeev" |sudo chpasswd
sudo echo "s.ivannikov:s.ivannikov" |sudo chpasswd

# create ssh keys
echo "d.alexeev" | su d.alexeev |sudo mkdir /home/d.alexeev/.ssh |sudo ssh-keygen -t rsa -f /home/d.alexeev/.ssh/id_rsa -N "" -C "d.alexeev@server"
echo "s.ivannikov" | su s.ivannikov |sudo mkdir /home/s.ivannikov/.ssh |sudo ssh-keygen -t rsa -f /home/s.ivannikov/.ssh/id_rsa -N "" -C "s.ivannikov@server"