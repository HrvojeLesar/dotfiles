#!/usr/bin/bash

if [ "$1" == "enable" ]; then
    echo "enabled"
    touch /tmp/bb-enabled
fi

if [ "$1" == "remove" ]; then
    echo "removed file"
    rm /tmp/bb-enabled
    hyprctl hyprpaper preload /home/hrvoje/.config/hypr/wallpapers/exarch.png
    hyprctl hyprpaper wallpaper DP-4,contain:/home/hrvoje/.config/hypr/wallpapers/exarch.png
    hyprctl hyprpaper wallpaper HDMI-A-2,contain:/home/hrvoje/.config/hypr/wallpapers/exarch.png
    hyprctl hyprpaper wallpaper ,contain:/home/hrvoje/.config/hypr/wallpapers/exarch.png
fi

if [ "$1" == "check" ]; then
    if [ -f /tmp/bb-enabled ]; then
        echo "BB"
    fi
    exit 0
fi

if ! [ -f /tmp/bb-enabled ]; then
    echo "died"
    exit 1
fi


names="83124170_874301766363558_1776044198005949229_n.jpg nov_nb.jpeg guc_m.jpg W_m.jpeg lon_m.jpg orig_m_nb.jpg ni_m.jpg"

selected_name=$(cat /tmp/bb-enabled)

if ! [ -z "${selected_name}" ]; then
    names=$(echo $names | sed "s/$selected_name//")
fi

file_name=$(shuf -n 1 -e $names)
echo "$file_name" > /tmp/bb-enabled

file="/home/hrvoje/.config/hypr/wallpapers/$file_name"

hyprctl hyprpaper preload $file
hyprctl hyprpaper wallpaper DP-4,contain:$file
hyprctl hyprpaper unload unused
