#!/usr/bin/bash

shouldUnpin=$(hyprctl activewindow -j | jq -r '.pinned')

if  [[ "$shouldUnpin" == "true" ]]; then
    hyprctl dispatch pin
fi

hyprctl dispatch movetoworkspacesilent special:restore, activewindow
