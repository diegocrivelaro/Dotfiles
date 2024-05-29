#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[1;32m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${GREEN}Iniciando o ambiente de desenvolvimento...${NC}"
sleep 3

# Update packages from the system
echo -e "${GREEN}Atualizando o sistema...${NC}"
sleep 3
sudo apt update || (echo -e "${RED}Erro!${NC}" && exit 1)
sudo apt upgrade -y || (echo -e "${RED}Erro!${NC}" && exit 1)

# Clear the cache
echo -e "${GREEN}Limpando o cache...${NC}"
sleep 3
sudo apt clean || (echo -e "${RED}Erro!${NC}" && exit 1)

# Create folders
echo -e "${GREEN}Criando pastas...${NC}"
sleep 3
mkdir ~/Development
mkdir ~/Development/Job
mkdir ~/Development/Personal
mkdir ~/Development/Studies
mkdir ~/Development/Clone
mkdir ~/Development/Clone/MyEnterprise

# Install packages
echo -e "${GREEN}Instalando pacotes...${NC}"
sleep 3
sudo apt install -y \
    git \
    curl \
    zsh \
    neofetch
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || (echo -e "${RED}Erro!${NC}" && exit 1)
cd ~/.oh-my-zsh/themes && git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 || (echo -e "${RED}Erro!${NC}" && exit 1)
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done || (echo -e "${RED}Erro!${NC}" && exit 1)
## Add Docker's official GPG key:
sudo apt-get update || (echo -e "${RED}Erro!${NC}" && exit 1)
sudo apt-get install ca-certificates curl || (echo -e "${RED}Erro!${NC}" && exit 1)
sudo install -m 0755 -d /etc/apt/keyrings || (echo -e "${RED}Erro!${NC}" && exit 1)
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc || (echo -e "${RED}Erro!${NC}" && exit 1)
sudo chmod a+r /etc/apt/keyrings/docker.asc || (echo -e "${RED}Erro!${NC}" && exit 1)

## Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update || (echo -e "${RED}Erro!${NC}" && exit 1)

## Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || (echo -e "${RED}Erro!${NC}" && exit 1)

## Install Node.Js (NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash || (echo -e "${RED}Erro!${NC}" && exit 1)
nvm install 20 || (echo -e "${RED}Erro!${NC}" && exit 1)
echo -e "${GREEN}Node.Js version: ${node -v} ${NC}"
echo -e "${GREEN}NPM version: ${npm -v} ${NC}"

# Configuring symbolic links
echo -e "${GREEN}Configurando Links Simbólicos...${NC}"
sleep 3
ln -s Dotfiles/.bash_logout ~/
ln -s Dotfiles/.bashrc ~/
ln -s Dotfiles/.profile ~/
ln -s Dotfiles/.zshrc ~/
ln -s Dotfiles/git/.gitconfig  ~/.gitconfig

# Reboot the system
echo -e "${GREEN}Reiniciando o sistema...${NC}"
sleep 5
sudo reboot