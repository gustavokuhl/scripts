#!/bin/bash

sudo_cmd=""

echo "Iniciando instalação..."

if command -v sudo &>/dev/null; then
	sudo_cmd="sudo"
	$sudo_cmd --askpass
fi

if ! command -v curl &>/dev/null; then
	echo "Atualizando pacotes..."
	$sudo_cmd apt update -y -qqq && \
	echo "Baixando o curl..."
	$sudo_cmd apt install curl -y -qqq
fi

echo "Baixando docker..."
cd /tmp && \
curl -fsSL https://get.docker.com -o get-docker.sh && \
sh ./get-docker.sh && \
rm get-docker.sh

# se não tiver sudo provavelmente é um container
if command -v sudo &>/dev/null; then
	echo "Ajustando o serviço docker"
	if command -v systemctl &>/dev/null; then
	$sudo_cmd systemctl enable docker.service
	$sudo_cmd systemctl enable containerd.service
	fi

	$sudo_cmd service docker start
	$sudo_cmd service containerd start

	echo "Adicionando o usuário $USER ao grupo docker"
	$sudo_cmd usermod -aG docker $USER
	newgrp docker
fi

echo "Tente o comando \`docker run hello-world\`"

exit
echo "Instalação concluída..."
