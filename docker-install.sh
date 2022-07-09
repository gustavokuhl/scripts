#!/bin/bash

echo "Iniciando instalação..."
sudo --askpass && \
cd /tmp && \
curl -fsSL https://get.docker.com -o get-docker.sh && \
sh ./get-docker.sh && \
rm get-docker.sh
sudo usermod -aG docker $USER
echo "Instalação concluída..."
exit
