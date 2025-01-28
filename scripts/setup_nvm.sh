#!/usr/bin/env bash

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

