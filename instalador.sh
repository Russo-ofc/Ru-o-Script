#!/bin/bash
set -e

##################################################################################
#                                                                                #
#                  Modelo De Projeto 'Instalador-Principal'                      #
#                                                                                #
#   Copyright (C) 2021, Russo & Adrian Config, <https://discord.gg/CSeweRNj3q>   #
#                                                                                #
##################################################################################



output(){
echo -e '\e[36m'$1'\e[0m';
}
        
warn(){
echo -e '\e[31m'$1'\e[0m';
}
        
PANEL=v0.0.1
        
 preflight(){
output "Script V-0.0.1"
output "Copyright © 2021."
}
        
install_options(){
output "Selecionar Oque Instalar Adrian:"
output "[1] Install the panel ${PANEL}."
read choice
case $choice in
1 ) installoption=1
output "You have selected ${PANEL} panel installation only."
;;
* ) output "You did not enter a valid selection."
install_options
esac
}
update() {
echo "* Update Do SISTEMA"
apt-get update
echo "* UPGRADE DO SISTEMA"
apt -y upgrade
        
echo "FINALIZADO"
}

dependencias() {
echo "* Baixando Todas As Dependencias..."
apt install -y software-properties-common apache2 mysql-server php libapache2-mod-php php-mysql php-gd php-cli php-common php-mbstring php-ldap php-odbc php-pear php-xml php-xmlrpc php-bcmath php-pdo default-jdk git zip unzip python-certbot-apache vimapt-get install -y software-properties-common apache2 mysql-server php libapache2-mod-php php-mysql php-gd php-cli php-common php-mbstring php-ldap php-odbc php-pear php-xml php-xmlrpc php-bcmath php-pdo default-jdk git zip unzip python-certbot-apache vim
        
echo "* OK"
}

#Execution
install_options
case $installoption in 
1)   update
dependencias
;;
esac
