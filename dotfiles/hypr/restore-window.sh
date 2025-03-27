#!/usr/bin/bash

clients=$(hyprctl -j clients)
addresses=($(echo $clients | jq -r '.[] | select(.workspace.name == "special:restore") | .address'))

clientIdx=$(echo $clients |
    jq 'map(select(.workspace.name == "special:restore")) | map("\(.title) | \(.initialTitle)")' |
    sed "s/,$//; s/^\[//; s/^\]//; s/^[[:blank:]]*//; s/^\"//; s/\"$//" |
    grep -v "^$" |
    rofi -dmenu -format i -p "Restore window")

[[ -n "$clientIdx" ]] || exit 1

address=${addresses[$clientIdx]}

hyprctl dispatch movetoworkspace +0,address:$address
