#!/bin/bash

#1 installer buster jessie
#2 activer ssh-vnc-sftp
#3 install dhcp
#4 install 

sudo apt update
sudo apt upgrade
sudo dist-upgrade

sudo apt install dnsmasq hostapd

sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

sudo cp dhcpd.conf /etc/


sudo service dhcpcd restart

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
sudo cp dnsmasq.conf/etc/dnsmasq.conf

sudo systemctl reload dnsmasq
sudo cp hostapd.conf /etc/hostapd/




sudo cp hostapd /etc/default/hostapd

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

sudo cp syctl.conf /etc/ 
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

sudo cp rc.local /etc/

ssh pi@192.168.4.1
