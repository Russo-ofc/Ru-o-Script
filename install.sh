#!/bin/bash

set -e

##################################################################################
#                                                                                #
#                  Modelo De Projeto 'Instalador-Principal'                      #
#                                                                                #
#   Copyright (C) 2021, Russo & Adrian Config, <https://discord.gg/CSeweRNj3q>   #
#                                                                                #
##################################################################################

INSTALACOES_UP="Multicraft, Apache, PhPMyAdmin (Com Dominio), Bin/Versões - Multicraft"
VS_SCRIPT="v0.0.1"

# Verfificar sé o usuário que está executando o script, tem privilégios ROOT.
if [[ $EUID -ne 0 ]]; then
  echo "* O Script precisa ser inicializado com privilégios ROOT (sudo)." 1>&2
  exit 1
fi

# Verificar se o curl está instalado para puxar os scripts de instalação originais
if ! [ -x "$(command -v curl)" ]; then
  echo "* curl é requisitado para o funcionamento do script."
  exit 1
fi

output() {
  echo -e "* ${1}"
}

error() {
  COLOR_RED='\033[0;31m'
  COLOR_NC='\033[0m'

  echo ""
  echo -e "* ${COLOR_RED}ERROR${COLOR_NC}: $1"
  echo ""
}

done=false

output "Script Privado Instalação de $VS_SCRIPT"
output "Instalação Completa/Configuração Instalação de $INSTALACOES_UP"
output
output "Copyright (C) 2021, Russo & Adrian Config, <https://discord.gg/CSeweRNj3q>"
output

multicraft() {
  bash <(curl -s https://raw.githubusercontent.com/WavenHosting/install.sh)
}

version() {
  bash <(curl -s https://raw.githubusercontent.com/)
}


while [ "$done" == false ]; do
  options=(
    "Instalar Multicraft Somente"
    "Instalar Versões"
  )

  actions=(
    "multicraft"
    "version"

  )

  output "._."

  for i in "${!options[@]}"; do
    output "[$i] ${options[$i]}"
  done

  echo -n "* Input 0-$((${#actions[@]}-1)): "
  read -r action

  [ -z "$action" ] && error "Input requisitado" && continue

  valid_input=("$(para ((i=0;i<=${#actions[@]}-1;i+=1)); do echo "${i}"; fim)")
  [[ ! " ${valid_input[*]} " =~ ${action} ]] && error "Opção Invalida"
  [[ " ${valid_input[*]} " =~ ${action} ]] && done=true && eval "${actions[$action]}"
done