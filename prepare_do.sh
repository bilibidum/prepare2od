#!/bin/bash
################################################################################
# Script de configuração para Droplets da Digital Ocean 
#
# OS = Ubuntu 14.04 LTS
# Author: Rafael
#
################################################################################

clear
echo -e "\n--- \033[01;32mDigite um nome para o novo usuario\033[01;37m ---"
read usuario
adduser $usuario

echo -e "\n--- \033[01;32mDigite uma senha para o novo usuario\033[01;37m ---"
passwd $usuario
echo -e "\n--- \033[01;32mTransformando o usuario criado em superadmin\033[01;37m ---" 
gpasswd -a $usuario sudo
sleep 3
echo -e "\n OK!" 

echo -e "\n--- \033[01;32mInstalando o GIT\033[01;37m ---"
sudo apt-get update
sudo apt-get install git
echo -e "\n OK!"

echo -e "\n--- \033[01;32mTrocando a porta SSH: 1221\033[01;37m ---"
sed -i 's/Port [0-9]\+$/Port 1221/' /etc/ssh/ssh_config
echo -e "\n--- Abrindo a porta \034[01;38mSSH: 1221\033[01;37m ---" 
sudo ufw allow 1221/tcp
sleep 5
echo -e "\n OK!"

echo -e "\n--- \033[01;32mAbrindo a porta: 8069\033[01;37m ---" 
sudo ufw allow 8069/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 80\033[01;37m ---" 
sudo ufw allow 80/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 443\033[01;37m ---" 
sudo ufw allow 443/tcp
sleep 2
echo -e "\n OK!"
echo -e "\n--- \033[01;32mAbrindo a porta: 25\033[01;37m ---" 
sudo ufw allow 25/tcp
sleep 2
echo -e "\n OK!"

echo -e "\n--- \033[01;32mRedirecionando a porta 8069 para a porta 80\033[01;37m ---" 
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8069
sleep 3
echo -e "\n OK!"

## Configure Timezones ##

sudo dpkg-reconfigure tzdata



echo -e "\n--- Criando SWAP : 2gb ---" 

sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
echo -e "\n OK!"
echo ""
echo ""
echo -e "\033[01;31m -- CONFIGURAÇAO REALIZADA COM SUCESSO --\033[01;37m"
echo ""
echo ""
