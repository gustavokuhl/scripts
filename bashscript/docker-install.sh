#!/bin/bash

echo "Iniciando instalação..."
sudo --askpass && \
cd /tmp && \
curl -fsSL https://get.docker.com -o get-docker.sh && \
sh ./get-docker.sh && \
rm get-docker.sh
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service
sudo systemctl start containerd.service
sudo usermod -aG docker $USER
echo "Instalação concluída..."
exit
