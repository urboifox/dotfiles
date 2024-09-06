#!/usr/bin/env bash

sudo apt install zsh -y || { echo "Failed to install zsh"; exit 1; }

# Remove existing Oh My Zsh directory if present
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing existing Oh My Zsh directory..."
    rm -rf "$HOME/.oh-my-zsh" || { echo "Failed to remove existing Oh My Zsh directory"; exit 1; }
fi

# Install Oh My Zsh in a subshell
echo "Installing Oh My Zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended || { echo "Failed to install Oh My Zsh"; exit 1; }

# Clone Oh My Zsh plugins
echo "Cloning Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { echo "Failed to clone zsh-autosuggestions"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "Failed to clone zsh-syntax-highlighting"; exit 1; }
echo "Finished installing zsh & Oh My Zsh."

# Change default shell to zsh
echo "Changing default shell to zsh..."
if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s "$(which zsh)" "$USER" || { echo "Failed to change default shell to zsh"; exit 1; }
    echo "Changed default shell to zsh."
else
    echo "Default shell is already zsh."
fi


echo "Add 'zsh-autosuggestions' and 'zsh-syntax-highlighting' to your .zshrc file in the 'plugins' variable"

