#!/usr/bin/bash

sudo systemctl enable systemd-resolved.service
sudo systemctl start systemd-resolved.service
