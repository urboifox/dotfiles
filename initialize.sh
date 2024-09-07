#!/usr/bin/env bash

# IMPORTANT: This script modifies neovim and default bash, i made it to speed up setting up a new OS. DONT run this unless you read what it does

ZSHRC_PATH="$HOME/.zshrc"
BASHRC_PATH="$HOME/.bashrc"
CURRENT_PATH="$(dirname "$0")"

# add neovim latest repo
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Update and upgrade
echo "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y || { echo "Failed to update and upgrade packages"; exit 1; }
# Install core packages
echo "Installing core packages..."
sudo apt install git pip python3-venv cava python3 nodejs neovim tree ripgrep fzf at curl zsh neofetch tmux lolcat cowsay figlet -y || { echo "Installing packages failed, make sure you are connected to the internet and try again."; exit 1; }
npm i -g eslint@8
echo "Finished installing packages."

# Run additional setup scripts
"$CURRENT_PATH/setup_fonts.sh" || { echo "Failed to run setup_fonts.sh"; exit 1; }
"$CURRENT_PATH/setup_nvim.sh" || { echo "Failed to run setup_nvim.sh"; exit 1; }
"$CURRENT_PATH/setup_github.sh" || { echo "Failed to run setup_github.sh"; exit 1; }
"$CURRENT_PATH/setup_tmux.sh" || { echo "Failed to run setup_tmux.sh"; exit 1; }
"$CURRENT_PATH/setup_zsh.sh" || { echo "Failed to run setup_zsh.sh"; exit 1; }
"$CURRENT_PATH/setup_nvm.sh" || { echo "Failed to run setup_nvm.sh"; exit 1; }
"$CURRENT_PATH/setup_aliases.sh" || { echo "Failed to run setup_aliases.sh"; exit 1; }

echo -e "\nAll good!"
echo "Finish the setup by doing the remaining steps:"
echo "1- Add 'zsh-autosuggestions' and 'zsh-syntax-highlighting' to your .zshrc file in the 'plugins' variable"
echo "2- Change the default font in your terminal to the nerd font inside setup_fonts.sh, for the file icons to work"
echo "3- Don't forget to log out and login again, for the default shell to refresh"

