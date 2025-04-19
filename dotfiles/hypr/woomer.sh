#!/usr/bin/bash

monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

woomer $monitor
