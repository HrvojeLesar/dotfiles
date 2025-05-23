#!/usr/bin/bash

hyprpm update
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors

hyprpm update
hyprpm enable hyprsplit
hyprpm enable dynamic-cursors
