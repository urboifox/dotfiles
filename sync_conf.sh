#!/usr/bin/env bash

REPO=$HOME/workspace/dotfiles
CWD=$(pwd)

# sync tmux config file
cp -f $HOME/.tmux.conf $REPO

# sync vim files
rm -rf $REPO/.config/nvim
cp -rf $HOME/.config/nvim $REPO/.config/

# sync sync script
cp -f "$0" $REPO

# sync with git
cd $REPO || exit

git add .
read -p "commit message: " commit_message
git commit -m "$commit_message:=Modified config files"

cd $CWD

