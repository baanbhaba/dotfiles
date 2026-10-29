#!/usr/bin/env bash

# -----------------------------------------------------
# POWER MENU - THEME-ADAPTIVE WLOGOUT WITH AUDIO FEEDBACK
# -----------------------------------------------------

if pgrep -x "wlogout" >/dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Tactile opening click
CLICK_SND="$HOME/.config/hypr/sounds/current/click.wav"
[ -f "$CLICK_SND" ] || CLICK_SND="$HOME/.config/hypr/sounds/click.wav"
paplay "$CLICK_SND" 2>/dev/null &

# Launch themed wlogout (6 buttons in 1 row with clean margins)
if command -v wlogout &>/dev/null; then
    wlogout -b 6 -c 16 -r 16 -m 240
    exit 0
fi

# Fallback to Rofi if wlogout is unavailable
lock="󰌾  Lock"
shutdown="  Shutdown"
reboot="󰜉  Reboot"
logout="󰈆  Logout"
hibernate="󰒲  Hibernate"

options="$lock\n$logout\n$hibernate\n$reboot\n$shutdown"
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/config.rasi)"

case "$chosen" in
    $shutdown) systemctl poweroff ;;
    $reboot) systemctl reboot ;;
    $logout) hyprctl dispatch exit ;;
    $lock)
        LOCK_SND="$HOME/.config/hypr/sounds/current/lock.wav"
        [ -f "$LOCK_SND" ] || LOCK_SND="$HOME/.config/hypr/sounds/lock.wav"
        paplay "$LOCK_SND" 2>/dev/null
        pidof hyprlock >/dev/null || hyprlock
        ;;
    $hibernate) systemctl hibernate ;;
esac
