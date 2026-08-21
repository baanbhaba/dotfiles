#!/bin/bash

active=$(hyprctl activeworkspace -j | jq '.id')

workspaces=$(hyprctl workspaces -j | jq -r '.[].id' | sort -n)

text=""

for ws in $workspaces; do
    if [ "$ws" = "$active" ]; then
        text+="󰮯 $ws "
    else
        text+="$ws "
    fi
done

echo "{\"text\":\"$text\"}"
