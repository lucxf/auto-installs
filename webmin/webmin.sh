#!/bin/bash

# Instalador Webmin usando el .deb más actual (acceso directo)

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}Actualizando el sistema...${NC}"
sudo apt update
sudo apt -y upgrade

echo -e "${CYAN}Instalando dependencias necesarias...${NC}"
sudo apt -y install wget

echo -e "${CYAN}Descargando el paquete más reciente de Webmin...${NC}"

DEB_URL="https://www.webmin.com/download/deb/webmin-current.deb"
wget -O webmin_latest.deb "$DEB_URL"

echo -e "${CYAN}Instalando el paquete...${NC}"
sudo dpkg -i webmin_latest.deb || sudo apt -f install -y

echo -e "${CYAN}Limpiando archivos temporales...${NC}"
rm -f webmin_latest.deb

# Obtener IP local principal
IP=$(hostname -I | awk '{print $1}')

echo -e "${GREEN}Webmin instalado correctamente.${NC}"
echo -e "${YELLOW}Accede en: ${CYAN}https://$IP:10000${NC}"
