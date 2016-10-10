#!/bin/bash
################################################################################
# Script de configuração para Droplets da Digital Ocean 
#
# OS = Ubuntu 14.04 LTS
# Author: Rafael
#
################################################################################

clear
echo -e "\n ------ INICIANDO A CONFIGURAÇÃO ------" 
echo -e "\n " 
echo -e "\n--- Abrindo a porta SSH: 22 ---" 
sudo ufw allow 22/tcp
sleep 5
echo -e "\n OK!"

echo -e "\n--- Abrindo a porta: 8069 ---" 
sudo ufw allow 8069/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- Abrindo a porta: 80 ---" 
sudo ufw allow 80/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- Abrindo a porta: 443 ---" 
sudo ufw allow 443/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- Abrindo a porta: 25  ---" 
sudo ufw allow 25/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- Trocando a porta 8069 pela 80 ---" 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8069

## Configure Timezones ##

sudo dpkg-reconfigure tzdata



echo -e "\n--- Criando SWAP : 2gb ---" 

sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
echo -e "\n OK!"
cd ..
sudo rm -R prepare2odoo
echo -e "\n "
echo -e "\n "
echo -e "\n "
echo -e "\033[01;31m   CONFIGURAÇAO REALIZADA COM SUCESSO\033[01;37m"
echo -e "\n "
echo -e "\n "
