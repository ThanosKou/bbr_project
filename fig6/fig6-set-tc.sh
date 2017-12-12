#!/bin/bash
sudo bash 
modprobe ifb numifbs=1
ip link set dev ifb0 up
ifconfig ifb0 txqueuelen 1000
tc qdisc del dev eth1 ingress
tc qdisc add dev eth1 handle ffff: ingress 
tc filter add dev eth1 parent ffff: protocol all u32 match u32 0 0 action mirred egress redirect dev ifb0

## server

sudo ethtool -K eth1 gso off tso off gro off;

 

## For server - eth1 
sudo bash  
tc qdisc del dev eth1 root
tc qdisc add dev eth1 root handle 1: htb default 10
tc class add dev eth1 parent 1: classid 1:10 htb rate 100Mbit
tc qdisc add dev eth1 parent 1:10 handle 20: netem delay 5ms limit 1024 


## For server - ifb0 
sudo bash 
tc qdisc del dev ifb0 root
tc qdisc add dev ifb0 root handle 1: htb default 10
tc class add dev ifb0 parent 1: classid 1:10 htb rate 100Mbit
tc qdisc add dev ifb0 parent 1:10 handle 20: netem delay 5ms limit 1024 

sudo bash
sudo ethtool -K eth1 gso off tso off gro off
sudo ethtool -K ifb0 gso off tso off gro off
