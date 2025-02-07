#!/usr/bin/bash

dir=$(pwd)

ln -sT $dir/waybar $HOME/.config/waybar && echo "Linked waybar"
ln -sT $dir/rofi $HOME/.config/rofi && echo "Linked rofi"
ln -sT $dir/flameshot $HOME/.config/flameshot && echo "Linked flameshot"
ln -sT $dir/hypr $HOME/.config/hypr && echo "Linked hypr"
ln -sT $dir/wlogout $HOME/.config/wlogout && echo "Linked wlogout"
