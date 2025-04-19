#!/usr/bin/bash

dir=$(pwd)

ln -sTf $dir/waybar $HOME/.config/waybar && echo "Linked waybar"
ln -sTf $dir/rofi $HOME/.config/rofi && echo "Linked rofi"
ln -sTf $dir/flameshot $HOME/.config/flameshot && echo "Linked flameshot"
ln -sTf $dir/hypr $HOME/.config/hypr && echo "Linked hypr"
ln -sTf $dir/wlogout $HOME/.config/wlogout && echo "Linked wlogout"
ln -s $dir/mimepps.list $HOME/.config/mimeapps.list && echo "Linked mimeapps"
ln -s $dir/.asloftrc $HOME/.alsoftrc && echo "Linked mimeapps"
ln -sTf $dir/cliphist $HOME/.config/cliphist && echo "Linked cliphist"
