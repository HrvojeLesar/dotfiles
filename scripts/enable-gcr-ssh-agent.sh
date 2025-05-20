#!/usr/bin/bash

mkdir -p $HOME/.config/systemd/user/sockets.target.wants
ln -s $dir/systemd/user/sockets.target.wants/gcr-ssh-agent.socket $HOME/.config/systemd/user/sockets.target.wants/gcr-ssh-agent.socket && echo "Linked gcr ssh agent"
systemctl --user enable gcr-ssh-agent.service
systemctl --user start gcr-ssh-agent.service
