#!/bin/bash

player_status="$(playerctl status 2> /dev/null)"

if [[ "$player_status" = "Playing" || "$player_status" = "Paused" ]]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo ""
fi
