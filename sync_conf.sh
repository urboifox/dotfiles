!#/usr/bin/env bash

REPO=$HOME/workspace/dotfiles

# replace tmux config file
cp -f $HOME/.tmux.conf $REPO

# replace vim files
cp -rf $HOME/.config/nvim $REPO/.config/

