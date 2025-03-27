#!/usr/bin/bash

count=$(hyprctl -j clients | jq 'map(select(.workspace.name == "special:restore")) | map("\(.title) | \(.initialTitle)") | length')

if [[ $count -eq 0 ]]; then
    exit 1
fi

echo $count
