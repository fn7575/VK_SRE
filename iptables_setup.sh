#!bin/bash

sudo iptables -F
sudo iptables -X
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
sudo iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
sudo iptables -A INPUT -s 192.168.2.0/24 -j ACCEPT
sudo iptables -A INPUT -p icmp -j REJECT --reject-with icmp-port-unreachable
mkdir -p /etc/iptables
sudo iptables-save > /etc/iptables/rules.v4
sudo iptables-save > /etc/iptables/rules.v6
sudo systemctl start iptables-persistent.service