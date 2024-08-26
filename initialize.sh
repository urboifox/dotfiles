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
sudo apt install git pip python3 nodejs neovim tree ripgrep fzf at curl zsh neofetch tmux lolcat cowsay figlet -y || { echo "Installing packages failed, make sure you are connected to the internet and try again."; exit 1; }
echo "Finished installing packages."

# Copy tmux config
cp "$CURRENT_PATH/.tmux.conf" "$HOME/.tmux.conf"


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

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash || { echo "Failed to install nvm"; exit 1; }
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install stable || { echo "Failed to install stable node version"; exit 1; }
nvm use stable || { echo "Failed to use stable node version"; exit 1; }
echo "Installed nvm and the stable version of nodejs."

# Check for aliases.txt
if [ ! -f "$CURRENT_PATH/aliases.txt" ]; then
    echo "Error: aliases.txt not found in the script directory."
    exit 1
fi

# Define a marker for where the aliases will be added
MARKER="# Custom Aliases"

# Add aliases to .zshrc and .bashrc
for RC_PATH in "$ZSHRC_PATH" "$BASHRC_PATH"; do
    if grep -Fxq "$MARKER" "$RC_PATH"; then
        echo "Aliases already present in $RC_PATH"
    else
        echo "$MARKER" >> "$RC_PATH"
        cat "$CURRENT_PATH/aliases.txt" >> "$RC_PATH"
    fi
done

# Run additional setup scripts
"$CURRENT_PATH/setup_nvim.sh" || { echo "Failed to run setup_nvim.sh"; exit 1; }
"$CURRENT_PATH/setup_github.sh" || { echo "Failed to run setup_github.sh"; exit 1; }

echo -e "\nAll good!"
echo "Finish the setup by doing the remaining steps:"
echo "1- Add 'zsh-autosuggestions' and 'zsh-syntax-highlighting' to your .zshrc file in the 'plugins' variable"
echo "IMPORTANT: Don't forget to log out and login again, for the default shell to refresh"

