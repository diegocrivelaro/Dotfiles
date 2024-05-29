# Diego Dotfiles

```bash
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

# Ferramentas

1. VSCode
2. Git
3. Postman
4. Opera GX
5. Google Chrome
6. Discord
7. TickTick
8. Obsidian
9. Spotify
10. WhatsApp
11. Figma
12. Authy Desktop
13. Wallpaper Engine
14. CPU-Z MSI
15. Steam
16. Epic Games
17. Ubisoft Play
18. EA
19. WSL 2
20. VoiceMeeter

# Comandos
Estes comandos devem ser executados sempre que o repositório for clonado em uma nova máquina.

## Atualizar o sistema
```bash
sudo apt update && sudo apt upgrade -y
```
## Criação de pastas
```bash
mkdir ~/Development
mkdir ~/Development/Job
mkdir ~/Development/Personal
mkdir ~/Development/Studies
mkdir ~/Development/Clone
mkdir ~/Development/Clone/MyEnterprise
```

## Instalar programas e ferramentas
```bash
sudo apt install git
sudo apt install curl
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sudo apt install neofetch
```