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

default_message="Modifies config files"
branch_name=$(git rev-parse --abbrev-ref HEAD)

read -p "commit message [$default_message]: " commit_message

git commit -m "${commit_message:-$default_message}"
git push origin $branch_name

cd $CWD

