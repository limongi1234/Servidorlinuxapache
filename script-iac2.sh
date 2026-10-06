#!/bin/bash
# Provisiona um servidor web Apache e publica o site de exemplo do curso de Linux da DIO.
# Uso: sudo ./script-iac2.sh
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Execute como root (sudo ./script-iac2.sh)" >&2
  exit 1
fi

echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y
apt-get install -y apache2 unzip wget

echo "Baixando e copiando os arquivos da aplicação..."
TMP=$(mktemp -d)
cd "$TMP"
wget -q https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip -q main.zip
cp -R linux-site-dio-main/* /var/www/html/
cd /
rm -rf "$TMP"

systemctl enable --now apache2

echo "Pronto! Acesse http://$(hostname -I | awk '{print $1}')"
