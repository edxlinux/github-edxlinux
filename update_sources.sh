#!/bin/bash

# URL do arquivo sources.list no GitHub
REPO_URL="https://raw.githubusercontent.com/edxlinux/github-edxlinux/main/sources.list"

# Diretório de backup
BACKUP_DIR="/etc/apt/backup"
# Nome do arquivo de backup com data e hora atuais
BACKUP_FILE="sources.list.bak.$(date +'%Y%m%d%H%M%S')"

# Cria o diretório de backup, se não existir
sudo mkdir -p $BACKUP_DIR

# Faz backup do arquivo sources.list atual
sudo cp /etc/apt/sources.list $BACKUP_DIR/$BACKUP_FILE

# Baixa o novo arquivo sources.list e substitui o antigo
sudo curl -o /etc/apt/sources.list $REPO_URL

# Atualiza a lista de pacotes
sudo apt update

# Atualiza os pacotes instalados
sudo apt upgrade -y

# Limpa pacotes obsoletos
sudo apt autoremove -y

echo "Atualização concluída. Backup do arquivo sources.list foi salvo em $BACKUP_DIR/$BACKUP_FILE"
