#!/usr/bin/bash

mode=$1

if [ $mode == "display" ]; then
    num_players=$(playerctl -l | wc -w)
    if [ $num_players -gt 1 ]; then
        exit 0
    fi

    exit 1
fi

if [ $mode == "current" ]; then
    echo $(playerctl -l | head -n 1 | cut -f1 -d".")
fi
