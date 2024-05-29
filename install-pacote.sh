#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script deve ser executado como root."
    exit 1
fi

# Verifica se o caminho para o pacote foi fornecido
if [ -z "$1" ]; then
    echo "Uso: $0 caminho_para_o_pacote.deb"
    exit 1
fi

PACOTE_DEB=$1

# Atualiza a lista de pacotes
echo "Atualizando lista de pacotes..."
apt-get update

# Instala dependências necessárias
echo "Instalando dependências..."
apt-get install -f -y

# Instala o pacote .deb
echo "Instalando o pacote $PACOTE_DEB..."
dpkg -i "$PACOTE_DEB"

# Verifica se houve erros de dependência e tenta corrigi-los
if [ $? -ne 0 ]; then
    echo "Tentando corrigir dependências quebradas..."
    apt-get install -f -y
fi

# Verifica se a instalação foi bem-sucedida
if dpkg -l | grep "$(basename "$PACOTE_DEB" .deb)" > /dev/null; then
    echo "Pacote instalado com sucesso."
else
    echo "Falha na instalação do pacote."
    exit 1
fi

echo "Script concluído."

