#!/usr/bin/env bash

CURRENT_PATH="$(pwd)"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   echo "sudo $0 $@" 1>&2
   exit 1
fi

echo "Setting up tmux"

mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
cp "$CURRENT_PATH/.tmux.conf" "$HOME/.tmux.conf"
cp -f "$CURRENT_PATH/tmux-sessionizer.sh" "/usr/local/bin/tmux-sessionizer"

if [[ ! -d ~/.tmux/plugins ]]; then
    mkdir -p ~/.tmux/plugins
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done!"

