#!/usr/bin/env bash

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

