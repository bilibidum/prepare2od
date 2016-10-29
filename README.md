# PREPARE TO OD

Script de comandos para a preparação do Droplet da Digital Ocean para o od

OS = Ubuntu 14.04 Server

#### Instalando o GIT (se for necessário)

> sudo apt-get update

> sudo apt-get install git


#### Baixando os arquivos da localização para o diretório do sistema
> sudo su - odoo -s /bin/bash
> mkdir localizacao
> cd localizacao
> git clone https://github.com/oca/l10n-brazil.git --branch 8.0 --depth 1
> git clone https://github.com/oca/account-fiscal-rule.git --branch 8.0 --depth 1
> git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git --branch 8.0 --depth 1
> git clone https://github.com/OCA/server-tools --branch 8.0 --depth 1
> exit


#### Baixando o script
> sudo git clone https://github.com/bilibidum/prepare2od.git


#### Executando o script
> cd prepare2od

> chmod +x prepare_do.sh

> sudo sh prepare_do.sh
