#!/usr/bin/env bash

# Hyprland workspace change OSD overlay (fast ~350ms duration)
SOCKET_PATH="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"

handle() {
    local event="$1"
    case "$event" in
        workspacev2>>*)
            local payload="${event#workspacev2>>}"
            local name="${payload#*,}"
            swayosd-client --custom-message "Workspace $name" -d 350 2>/dev/null &
            ;;
        workspace>>*)
            local name="${event#workspace>>}"
            swayosd-client --custom-message "Workspace $name" -d 350 2>/dev/null &
            ;;
    esac
}

if [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" && -S "$SOCKET_PATH" ]]; then
    socat -U - "UNIX-CONNECT:$SOCKET_PATH" | while read -r line; do
        handle "$line"
    done
fi
