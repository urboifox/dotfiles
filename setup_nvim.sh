#!/usr/bin/env bash

CURRENT_PATH="$(dirname "$0")"

echo "Setting up Neovim..."

mv $HOME/.config/nvim $HOME/.config/nvim.bak &> /dev/null
cp -r $CURRENT_PATH/.config/nvim $HOME/.config

echo "Done!"
