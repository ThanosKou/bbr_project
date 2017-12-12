#!/bin/bash

## FOR CLIENT 


sudo bash 
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root fq pacing
sudo ethtool -K eth1 gso off tso off gro off



## change window size 


echo "Increase maximum buffer sizes."
sudo sysctl -w net.core.rmem_max=6553600
sudo sysctl -w net.core.wmem_max=6553600
sudo sysctl -w net.core.rmem_default=6553600
sudo sysctl -w net.core.wmem_default=6553600
sudo sysctl -w net.ipv4.tcp_rmem='4096 6553600 6553600'
sudo sysctl -w net.ipv4.tcp_wmem='4096 6553600 6553600'
sudo sysctl -w net.ipv4.tcp_mem='6553600 6553600 6553600'
sudo sysctl -w net.ipv4.route.flush=1
