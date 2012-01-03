#! /bin/bash

sudo route add -net 192.168.0.0/16 gw 172.31.12.10
sudo route add -net 10.0.0.0/8 gw 172.31.12.10
sudo route add -net 172.16.0.0/12 gw 172.31.12.10
