#!/bin/bash

set -e

echo "🚀 Instalando JARVIS SAAS"

sudo apt update -y
sudo apt upgrade -y

curl -fsSL https://get.docker.com | sh

sudo systemctl enable docker
sudo systemctl start docker

sudo apt install -y git docker-compose

mkdir -p /opt/jarvis
cd /opt/jarvis

git clone https://github.com/SEUUSUARIO/jarvis-saas .

docker compose up -d

docker exec -it ollama ollama pull llama3

IP=$(hostname -I | awk '{print $1}')

echo ""
echo "Sistema instalado"
echo ""

echo "Painel IA"
echo "http://$IP:8080"

echo "Home Assistant"
echo "http://$IP:8123"

echo "NodeRED"
echo "http://$IP:1880"