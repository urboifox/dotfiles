#!/bin/bash

# Icons
TERM_ICON=""
NVIM_ICON=""

# Get the active window's title
title=$(xdotool getactivewindow getwindowname 2>/dev/null)

# List of common terminal emulator titles or patterns
TERMINAL_PATTERNS=("TERM:" ":~" "Terminal" "xterm" "kitty" "alacritty" "gnome-terminal")

# Check if the window is a terminal
is_terminal=false
for pattern in "${TERMINAL_PATTERNS[@]}"; do
    if [[ "$title" == *"$pattern"* ]]; then
        is_terminal=true
        break
    fi
done

# Neovim: show file name or directory
if [[ "$title" == *NVIM* ]]; then
    if [[ "$title" == NVIM:* ]]; then
        file_path="${title#NVIM: }"
        file_name=$(basename "$file_path" 2>/dev/null || echo "nvim")
        # if file_name equals "NvimTree_1" make it "Nvim Tree"
        if [[ "$file_name" == "NvimTree_1" ]]; then
            file_name="NvimTree"
        fi
        echo "$NVIM_ICON $file_name"
    else
        dir=$(pwd | sed "s|$HOME|~|")
        echo "$NVIM_ICON ${dir##*/}"
    fi
# Terminal: show directory
elif [[ "$is_terminal" == true ]]; then
    # Extract path from common terminal title formats
    if [[ "$title" == TERM:* ]]; then
        dir_path="${title#TERM: }"
    elif [[ "$title" == *:* && "$title" == *~/* ]]; then
        dir_path="${title##*:}"
    elif [[ "$title" == */* ]]; then
        dir_path="$title"
    else
        # No path in title, use pwd
        dir_path=$(pwd | sed "s|$HOME|~|")
    fi
    dir_name=$(basename "$dir_path" 2>/dev/null || echo "term")
    echo "$TERM_ICON  $dir_name"
# Non-terminal apps: mimic xwindow behavior
else
    # Truncate title to 40 chars, like xwindow module
    echo "${title:0:40}"
fi
