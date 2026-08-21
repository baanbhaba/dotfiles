#!/usr/bin/env bash

ws="$1"
action="$2"

if [ "$action" = "switch" ]; then
    hyprctl dispatch workspace "$ws"
    exit 0
fi

active_ws=$(hyprctl activeworkspace -j 2>/dev/null | grep '"id":' | head -n 1 | awk '{print $2}' | tr -d ',')
windows_in_ws=$(hyprctl workspaces -j 2>/dev/null | grep -B 2 -A 5 "\"id\": $ws" | grep '"windows":' | awk '{print $2}' | tr -d ',')

if [ "$active_ws" = "$ws" ]; then
    text="$ws"
    class="active"
elif [ -n "$windows_in_ws" ] && [ "$windows_in_ws" -gt 0 ]; then
    text="$ws"
    class="occupied"
else
    text=""
    class="hidden"
fi

printf '{"text":"%s","class":"%s"}\n' "$text" "$class"
