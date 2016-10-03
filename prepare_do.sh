#!/bin/bash
################################################################################
# Script de configuração para Droplets da Digital Ocean 
#
# OS = Ubuntu 14.04 LTS
# Author: Rafael
#
################################################################################

clear
echo -e "\n--- Abrindo a porta \033[01;36mSSH: 22 \033[01;37m ---" 
sudo ufw allow 22/tcp
sleep 5
echo -e "\n OK!"

echo -e "\n--- \033[01;32mAbrindo a porta: 8069 \033[01;37m ---" 
sudo ufw allow 8069/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 80 \033[01;37m ---" 
sudo ufw allow 80/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 443 \033[01;37m ---" 
sudo ufw allow 443/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 25 \033[01;37m ---" 
sudo ufw allow 25/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mTrocando a porta 8069 pela 80 \033[01;37m ---" 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8069

## Configure Timezones ##

sudo dpkg-reconfigure tzdata



echo -e "\n--- \033[01;32mCriando SWAP : 2gb \033[01;37m ---" 

sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
echo -e "\n OK!"
echo -e "\n "
echo -e "\n "
echo -e "\n "
echo -e "\033[01;31m -- CONFIGURAÇAO REALIZADA COM SUCESSO --\033[01;37m"
echo -e "\n "
echo -e "\n "
