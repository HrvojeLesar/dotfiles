#!/usr/bin/bash

dir=$(pwd)

ln -sTf $dir/waybar $HOME/.config/waybar && echo "Linked waybar"
ln -sTf $dir/rofi $HOME/.config/rofi && echo "Linked rofi"
ln -sTf $dir/flameshot $HOME/.config/flameshot && echo "Linked flameshot"
ln -sTf $dir/hypr $HOME/.config/hypr && echo "Linked hypr"
ln -sTf $dir/wlogout $HOME/.config/wlogout && echo "Linked wlogout"
ln -s $dir/mimepps.list $HOME/.config/mimeapps.list && echo "Linked mimeapps"
ln -s $dir/.asloftrc $HOME/.alsoftrc && echo "Linked alsoftrc"
ln -sTf $dir/cliphist $HOME/.config/cliphist && echo "Linked cliphist"

mkdir -p $HOME/.config/systemd/user/sockets.target.wants
ln -s $dir/systemd/user/sockets.target.wants/gcr-ssh-agent.socket $HOME/.config/systemd/user/sockets.target.wants/gcr-ssh-agent.socket && echo "Linked gcr ssh agent"
echo "Enabling gcr ssh agent service"
systemctl --user enable gcr-ssh-agent.service
systemctl --user start gcr-ssh-agent.service

ln -sTf $dir/wezterm $HOME/.config/wezterm && echo "Linked wezterm"

ln -s $dir/.tmux.conf $HOME/.tmux.conf && echo "Linked .tmux.conf"
ln -s $dir/.zsh_profile $HOME/.zsh_profile && echo "Linked .zsh_profile"
ln -s $dir/.zshrc $HOME/.zshrc && echo "Linked .zshrc"
