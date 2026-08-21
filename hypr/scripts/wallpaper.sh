#!/bin/bash

# -----------------------------------------------------
# WALLPAPER SWITCHER - Robust Multi-Monitor & Theme Support
# -----------------------------------------------------

THEME=$(cat ~/.config/hypr/.theme_current 2>/dev/null || echo "charcoal")
WALLPAPER_DIR="$HOME/.config/hypr/themes/$THEME/wallpapers"
INDEX_FILE="/tmp/current_wallpaper_index_${THEME}"

if [ -d "$WALLPAPER_DIR" ] && [ "$(ls -A "$WALLPAPER_DIR" 2>/dev/null)" ]; then
    mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \))
    
    if [ ${#WALLPAPERS[@]} -gt 0 ]; then
        if [ -f "$INDEX_FILE" ]; then
            CURRENT_INDEX=$(cat "$INDEX_FILE")
            NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))
        else
            NEXT_INDEX=0
        fi
        
        WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"
        
        if command -v hyprpaper >/dev/null 2>&1; then
            killall hyprpaper 2>/dev/null
            
            # Generate config matching all connected monitor names
            CONFIG_FILE="/tmp/hyprpaper.conf"
            echo "preload = $WALLPAPER" > "$CONFIG_FILE"
            echo "splash = false" >> "$CONFIG_FILE"
            
            # Query all active monitors
            MONITORS=$(hyprctl monitors -j 2>/dev/null | grep '"name":' | awk -F '"' '{print $4}' | grep -v '^[0-9]*$' | grep -v '^$')
            if [ -n "$MONITORS" ]; then
                for mon in $MONITORS; do
                    echo "wallpaper = $mon,$WALLPAPER" >> "$CONFIG_FILE"
                done
            else
                echo "wallpaper = ,$WALLPAPER" >> "$CONFIG_FILE"
            fi
            
            hyprpaper -c "$CONFIG_FILE" &
        elif command -v swaybg >/dev/null 2>&1; then
            killall swaybg 2>/dev/null
            swaybg -i "$WALLPAPER" -m fill &
        fi
        
        echo "$NEXT_INDEX" > "$INDEX_FILE"
        notify-send "Wallpaper" "Changed to: $(basename "$WALLPAPER")" -i preferences-desktop-wallpaper 2>/dev/null || true
    fi
fi
