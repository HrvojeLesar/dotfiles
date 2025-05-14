#!/usr/bin/bash

hyprpm update

hyprpm add https://github.com/shezdy/hyprsplit
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors

hyprpm enable dynamic-cursors
hyprpm enable hyprsplit

hyprpm reload
