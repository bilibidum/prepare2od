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

echo -e "\n--- Atualizando o sistema ---" 
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install python-dev python-yaml python-feedparser python-geoip python-imaging python-pybabel python-unicodecsv wkhtmltopdf libxml2-dev libxmlsec1-dev python-argparse python-Babel python-cups python-dateutil python-decorator python-docutils python-feedparser python-gdata pythongevent python-greenlet python-Jinja2 python-libxslt1 python-lxml python-Mako python-MarkupSafe python-mock python-openid python-passlib pythonpsutil python-psycopg2 python-pychart python-pydot python-pyparsing pythonpyPdf python-ldap python-yaml python-reportlab python-requests pythonsimplejson python-six python-tz python-unittest2 python-vatnumber pythonvobject python-webdav python-Werkzeug python-wsgiref python-xlwt python-zsi python-dev libpq-dev poppler-utils python-pdftools antiword
sudo apt-get install python-pip 
sudo apt-get install python-setuptools 
sudo pip install pyserial==2.7
sudo pip install psycogreen==1.0
sudo pip install pyusb==1.0.0b1
sudo pip install qrcode==5.0.1
sudo apt-get install python-dev
sudo pip install Pillow==2.5.1
sudo pip install boto==2.38.0
sudo pip install oerplib==0.8.4
sudo pip install jcconv==0.2.3
sudo pip install pytz==2014.4
sudo pip install suds
sudo pip install suds_requests

echo -e "\n--- Instalando o wkhtmltopdf ---" 
cd /tmp
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo apt-get install -f
sudo dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin
wkhtmltopdf -–version

echo -e "\n--- Criando SWAP : 2gb ---" 

sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
echo -e "\n OK!"
\cd ..
sudo rm -R prepare2odoo
echo -e "\n "
echo -e "\n "
echo -e "\n "
echo -e "n----- CONFIGURAÇAO REALIZADA COM SUCESSO -----"
echo -e "\n "
echo -e "\n "
