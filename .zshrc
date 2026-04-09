export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias vim='/opt/nvim/nvim'
alias mx='tmux'
alias mxs='tmux new -s'
alias mxa='tmux attach'
alias mxat='tmux attach -t'
alias mxd='tmux detach'
alias mxr='tmux rename-session -t'
alias mxk='tmux kill-session -t'
alias ll='ls -l'
alias lh='ls -lah'
alias la='ls -a'
alias lg='lazygit'
alias cava='TERM=xterm-256color cava'

# Set tmux sessionizer shortcut
bindkey -s ^f "tmux-sessionizer\n"

# Set terminal title
precmd() { echo -ne "\033]0;TERM: $PWD\007" }

# open tmux on startup if not in tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Set default editor
export EDITOR="vim"

# Set keyboard layout
setxkbmap -model pc104 -layout us,ara -variant ,, -option grp:alt_shift_toggle # Set keyboard layout (i.e us, ara)
