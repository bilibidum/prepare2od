#!/bin/bash
################################################################################
# Script for Installation: Digital Ocean - Droplet - Ubuntu 14.04 LTS
#
# Author: Rafael.
#
################################################################################

clear
echo -e "\n--- Criando o usuario \033[01;32mrafleand\033[01;37m! ---"
Adduser rafleand
echo -e "\n--- Transformando o usuario criado em superadmin ---" 
gpasswd -a rafleand sudo

echo -e "\n--- Instalando o \033[01;32mGIT\033[01;37m ---"
sudo apt-get update
sudo apt-get install git

echo -e "\n--- Trocando a porta \033[01;32mSSH: 1221\033[01;37m ---"
sed -i 's/Port [0-9]\+$/Port 1221/' /etc/ssh/ssh_config
echo -e "\n--- Abrindo a porta \033[01;32mSSH: 1221\033[01;37m ---" 
sudo ufw allow 1221/tcp

echo -e "\n--- Abrindo a porta: 8069 ---" 
sudo ufw allow 8069/tcp
echo -e "\n--- Abrindo a porta: 80 ---" 
sudo ufw allow 80/tcp
echo -e "\n--- Abrindo a porta: 443 ---" 
sudo ufw allow 443/tcp
echo -e "\n--- Abrindo a porta: 25 ---" 
sudo ufw allow 25/tcp


echo -e "\n--- Redirecionando a porta 8069 para a porta 80 ---" 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8069

## Configure Timezones ##

sudo dpkg-reconfigure tzdata



echo -e "\n--- Criando SWAP : 2gb ---" 

sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'


echo -e "\033[01;31m -- CONFIGURAÇAO REALIZADA COM SUCESSO --\033[01;37m"







