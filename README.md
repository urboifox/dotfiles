# Dotfiles

This repository contains scripts for setting up your development environment with essential tools and configurations.


## Files

- aliases.txt: Contains custom shell aliases. These aliases will be added to your .bashrc and .zshrc files during setup.

- initialize.sh: A shell script for installing core packages, setting up zsh, and configuring various tools and plugins. It handles the installation of packages, configuration of shell, and setup of nvm (Node Version Manager) and Oh My Zsh.

- setup_github.sh: A script to configure GitHub settings, such as setting up SSH keys or configuring Git settings. This script should be customized based on your specific GitHub setup requirements.

- setup_nvim.sh: A script to set up Neovim with your preferred configuration. It installs and configures Neovim plugins and settings.
  
- .config: Contains multiple config files for different packages, for example: setup_nvim.sh uses the nvim directory inside it to setup neovim


## How to use

1. Clone the Repository:
```bash
git clone https://github.com/urboifox/dotfiles
cd dotfiles
```

2. Run Initialization Script: Execute the initialize.sh script to install core packages and set up your development environment:
```bash
chmod u+x initialization.sh
bash initialization.sh
# WARNING: It's recommended to read this script before running it, it modifies node, neovim, and other packages and directories on your system
# if you are not sure, just run the setup_neovim.sh or setup_github.sh based on your needs.
```

3. Run GitHub Setup Script: takes your github email and generates an ssh key:
```bash
chmod u+x setup_github.sh
bash setup_github.sh
```


4. Run Neovim Setup Script: Configure Neovim and adds custom configuration and plugins using Lazy.nvim:
```bash
chmod u+x setup_github.sh
bash setup_nvim.sh
```

Feel free to adjust the scripts according to your specific needs or environment.


