#!/bin/bash
################################################################################
# Script de configuração para Droplets da Digital Ocean 
#
# OS = Ubuntu 14.04 LTS
# Author: Rafael
#
################################################################################

apt-get update
apt-get dist-upgrade
apt-get install -y sudo
sudo apt-get install -y figlet
sudo /etc/init.d/odoo-server stop
clear
figlet -f standard "Iniciando . . ."
figlet -f term "### Abrindo a porta SSH: 22 #####"
sudo ufw allow 22/tcp
sleep 5
figlet -f term "Feito!"

figlet -f term "##### Abrindo a porta: 8069 #####"
sudo ufw allow 8069/tcp
sleep 2
figlet -f term "Feito!"

figlet -f term "##### Abrindo a porta: 80 #####" 
sudo ufw allow 80/tcp
sleep 2
figlet -f term "Feito!"

figlet -f term "##### Abrindo a porta: 443 #####" 
sudo ufw allow 443/tcp
sleep 2
figlet -f term "Feito!"
figlet -f term "##### Abrindo a porta: 25  #####" 
sudo ufw allow 25/tcp
sleep 2
figlet -f term "Feito!"

figlet -f term "##### Atualizando o sistema #####"
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install -y python-dev python-yaml python-feedparser python-geoip python-imaging python-pybabel python-unicodecsv wkhtmltopdf libxml2-dev libxmlsec1-dev python-argparse python-Babel python-cups python-dateutil python-decorator python-docutils python-feedparser python-gdata pythongevent python-greenlet python-Jinja2 python-libxslt1 python-lxml python-Mako python-MarkupSafe python-mock python-openid python-passlib pythonpsutil python-psycopg2 python-pychart python-pydot python-pyparsing pythonpyPdf python-ldap python-yaml python-reportlab python-requests pythonsimplejson python-six python-tz python-unittest2 python-vatnumber pythonvobject python-webdav python-Werkzeug python-wsgiref python-xlwt python-zsi python-dev libpq-dev poppler-utils python-pdftools antiword
sudo apt-get install -y python-pip 
sudo apt-get install -y python-setuptools 
sudo pip install pyserial==2.7
sudo pip install psycogreen==1.0
sudo pip install pyusb==1.0.0b1
sudo pip install qrcode==5.0.1
sudo apt-get install -y python-dev
sudo pip install Pillow==2.5.1
sudo pip install boto==2.38.0
sudo pip install oerplib==0.8.4
sudo pip install jcconv==0.2.3
sudo pip install pytz==2014.4
sudo pip install suds
sudo pip install suds_requests

sudo apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev
sudo easy_install greenlet
sudo easy_install gevent
sudo apt-get install -y libxmlsec1-dev
sudo pip install https://github.com/aricaldeira/pyxmlsec/archive/master.zip
sudo pip install --upgrade reportlab

figlet -f term "##### Instalando o wkhtmltopdf #####" 
cd /tmp
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo apt-get install -f
sudo dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin
wkhtmltopdf -–version

figlet -f term "##### Configurando locales #####" 
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y locales
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales

figlet -f term "##### Criando LocalizBR #####" 
cd /opt/odoo
mkdir localizacao
cd localizacao
git clone https://github.com/oca/l10n-brazil.git --branch 8.0 --depth 1
git clone https://github.com/oca/account-fiscal-rule.git --branch 8.0 --depth 1
git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git --branch 8.0 --depth 1
git clone https://github.com/OCA/server-tools --branch 8.0 --depth 1
cd /opt/odoo
sudo chown -R odoo:odoo localizacao
chmod  -R   755 localizacao
cd /tmp
git clone https://github.com/odoo-brazil/geraldo --branch master
cd geraldo
sudo python setup.py install

figlet -f term "##### Config Localizacao Brasileira #####" 
sudo apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev
sudo easy_install greenlet
sudo easy_install gevent
sudo apt-get install -y libxmlsec1-dev
sudo pip install https://github.com/aricaldeira/pyxmlsec/archive/master.zip
cd /tmp
wget http://labs.libre-entreprise.org/download.php/430/pyxmlsec-0.3.0.tar.gz
tar xvzf pyxmlsec-0.3.0.tar.gz
cd pyxmlsec-0.3.0
python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/PySPED.git --branch 8.0
cd PySPED
sudo python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/pyxmlsec --branch master
cd pyxmlsec
sudo python setup.py install


figlet -f term "##### Criando SWAP : 2gb #####" 
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'

figlet -f term " "
figlet -f term " "
figlet -f term " "
figlet -f term "##### SCRIPT FINALIZADA COM SUCESSO #####"
figlet -f term " "
figlet -f term " "
