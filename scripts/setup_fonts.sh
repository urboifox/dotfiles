#!/usr/bin/env bash

echo "Installing fonts..."
sudo apt install fontconfig
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
mkdir -p $HOME/.local/share/fonts
unzip Meslo.zip -d $HOME/.local/share/fonts
rm $HOME/.local/share/fonts/*Windows*
rm Meslo.zip
fc-cache -fv
echo "Done!"

