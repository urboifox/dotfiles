# Dotfiles

This repository contains my personal dotfiles, managed using GNU Stow. Dotfiles are used to configure various tools and applications, and GNU Stow helps symlink them to their appropriate locations in the home directory.

## Installation

1. **Clone the repository** to your desired location:

   ```bash
   git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
   ```
   
2. **Install Stow** using your preferred package manager:

   ```bash
   # Using Homebrew
   brew install stow

   # Using apt-get
   sudo apt-get install stow
   ```

3. **Remove the existing config** for a specific tool:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

4. **Symlink the tool config file** to your config directory:

   ```bash
   stow ~/dotfiles/nvim -t ~/.config
   ```

5. **Or you can symlink the entire directory** to your home directory:

   ```bash
   stow ~/dotfiles/ -t ~/ # Make sure you make backups of your existing dotfiles first!
   ```
