#!/usr/bin/bash

names="01_49695845b2d0d020082b36a7e7575357.jpg 02_d300577b6ec4c1eef265acc9e9f5fc64_01.jpg exarch.png"

if [ "$1" == "enable" ]; then
    echo "enabled"
    read -sp "Enable bb: " enabled
    if ! [ "$enabled" == "bb" ]; then
        exit 0
    fi
    touch /tmp/bb-enabled
fi

if [ "$1" == "remove" ]; then
    echo "removed file"
    rm /tmp/bb-enabled
    hyprctl hyprpaper wallpaper DP-4,/home/hrvoje/.config/hypr/wallpapers/exarch.png,contain
    hyprctl hyprpaper wallpaper HDMI-A-2,/home/hrvoje/.config/hypr/wallpapers/exarch.png,contain
    hyprctl hyprpaper wallpaper ,/home/hrvoje/.config/hypr/wallpapers/exarch.png,contain
fi

if [ "$1" == "check" ]; then
    if [ -f /tmp/bb-enabled ]; then
        echo "BB"
    fi
    exit 0
fi

if [ "$1" == "bb" ]; then
    read -sp "bb:" enabled
    if ! [ "$enabled" == "bb" ]; then
        exit 0
    fi
    cd ~/.config/hypr/wallpapers && shuf -e $names | imv -s crop -t 1800 & disown

    exit 0
fi

if ! [ -f /tmp/bb-enabled ]; then
    echo "died"
    exit 1
fi


selected_name=$(cat /tmp/bb-enabled)

if ! [ -z "${selected_name}" ]; then
    names=$(echo $names | sed "s/$selected_name//")
fi

file_name=$(shuf -n 1 -e $names)
echo "$file_name" > /tmp/bb-enabled

file="/home/hrvoje/.config/hypr/wallpapers/$file_name"

hyprctl hyprpaper wallpaper DP-4,$file,contain
