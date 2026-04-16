#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"

# packages
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch || true
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update

sudo apt install -y \
    git fastfetch stow fzf cava rofi picom feh fontconfig flameshot vlc \
    bspwm sxhkd polybar tmux tty-clock xclip build-essential obs-studio pavucontrol \

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# dust
curl -sSfL https://raw.githubusercontent.com/bootandy/dust/refs/heads/master/install.sh | sh

# repo
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/urboifox/dotfiles.git "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# stow (force restow safely)
stow -t "$HOME" --restow .

# zsh config
cp -f .zshrc "$HOME"

# nvim
if ! command -v nvim >/dev/null; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
    chmod u+x nvim-linux-x86_64.appimage
    sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
fi

# ghostty
if ! command -v ghostty >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
fi

# bun
if [ ! -d "$HOME/.bun" ]; then
    curl -fsSL https://bun.com/install | bash
fi

# tmux plugin manager
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    mkdir -p "$HOME/.config/tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# nvm
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
fi

# change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
fi

# fonts
tmp="$(mktemp -d)"
curl -L \
  -o "$tmp/font.tar.xz" \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir -p ~/.local/share/fonts
tar -xf "$tmp/font.tar.xz" -C ~/.local/share/fonts
fc-cache -fv
rm -rf "$tmp"

echo "Installation finished! Reboot or log out to see changes."
