#!/bin/bash

# Command to run (play-pause, next, previous)
command="$1"

# Check if Spotify is running
if playerctl --player=spotify status &>/dev/null; then
    playerctl --player=spotify "$command"
else
    playerctl "$command"
fi

