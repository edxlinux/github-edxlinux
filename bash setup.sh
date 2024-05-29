#!/bin/bash

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar ferramentas essenciais
sudo apt install -y build-essential curl wget git

# Instalar Python
sudo apt install -y python3 python3-pip

# Instalar Node.js e npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Instalar Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Adicionar o usuário atual ao grupo docker
sudo usermod -aG docker $USER

# Clonar um repositório do GitHub (exemplo)
git clone https://github.com/seu-usuario/seu-repositorio.git

# Configurar o ambiente Python (exemplo)
cd seu-repositorio
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Configurar o ambiente Node.js (exemplo)
npm install

echo "Configuração concluída com sucesso!"
