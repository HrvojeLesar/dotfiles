#!/usr/bin/bash

current_date=$(date +"%d.%m")
current_date_full=$(date +"%d.%m.%Y")

result=""

count=0
while read -r event ; do
    event_date=$(echo $event | cut -d ':' -f 1)
    event_description=$(echo $event | cut -d ':' -f 2-)

    if [[ "$current_date" == "$event_date" ]] || [[ "$current_date_full" == "$event_date" ]]; then
        if [[ $count -eq 0 ]]; then
            result="${event_description}"
        else
            result="${result} | ${event_description}"
        fi
        ((count++))
    fi
done < ~/.config/waybar/events

if [[ $count -eq 0 ]]; then
    exit 1
fi

echo $result
