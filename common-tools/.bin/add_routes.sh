#! /bin/bash

sudo iptables -A OUTPUT -p tcp -d 173.194.52.0/22 -j REJECT --reject-with tcp-reset
sudo route add -net 192.168.0.0/16 gw 192.168.100.10
sudo route add -net 10.0.0.0/8 gw 192.168.100.10
sudo route add -net 172.16.0.0/12 gw 192.168.100.10
