#!bin/bash

# ipcs -l expanation
sudo ipcs -l
echo "'max queues system wide' - максимум очередей"
echo "'max size of message' - максимальный размер сообщения"
echo "'max number of segments'- максимальное количество сегментов"
echo "'max seg size' - максимальный размер сегмента (кб)"
echo "'min seg size' - минимальный размер сегмента (байты)"
echo "'max total shared memory' - максимальный размер разделяемой памяти (байты)"

# setup netfilter
sudo modprobe ip_conntrack
sudo sysctl -w net.netfilter.nf_conntrack_max=4096
sudo sysctl -p
echo "проверка результата:"
sudo sysctl -a | grep conntrack_max
