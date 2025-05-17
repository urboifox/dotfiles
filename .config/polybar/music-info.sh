#!/bin/bash

# Try Spotify first
spotify_status="$(playerctl --player=spotify status 2>/dev/null)"

if [[ "$spotify_status" == "Playing" || "$spotify_status" == "Paused" ]]; then
    title="$(playerctl --player=spotify metadata title 2>/dev/null)"
    artist="$(playerctl --player=spotify metadata artist 2>/dev/null)"
    echo "$title - $artist"
else
    # Fallback: first available non-spotify player
    fallback_player=$(playerctl -l 2>/dev/null | grep -v spotify | head -n 1)
    if [[ -n "$fallback_player" ]]; then
        status="$(playerctl --player="$fallback_player" status 2>/dev/null)"
        if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
            title="$(playerctl --player="$fallback_player" metadata title 2>/dev/null)"
            artist="$(playerctl --player="$fallback_player" metadata artist 2>/dev/null)"
            echo "$title - $artist"
        else
            echo ""
        fi
    else
        echo ""
    fi
fi
