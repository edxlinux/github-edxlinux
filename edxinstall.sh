#!/bin/bash

# Nome do script: edxinstall

# Verificar se o usuário é root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script precisa ser executado como root. Use sudo."
  exit 1
fi

# Atualizar lista de pacotes
echo "Atualizando a lista de pacotes..."
apt update

# Instalar pacotes
echo "Instalando pacotes: kaffeine, k3b, brasero, gparted..."
apt install -y kaffeine k3b brasero gparted

# Verificar se a instalação foi bem-sucedida
if [ $? -eq 0 ]; then
  echo "Instalação concluída com sucesso!"
else
  echo "Houve um problema na instalação dos pacotes."
fi


