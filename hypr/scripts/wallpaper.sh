#!/bin/bash

# -----------------------------------------------------
# WALLPAPER SWITCHER - Robust Multi-Monitor & Theme Support
# -----------------------------------------------------

THEME=$(cat "$HOME/.config/hypr/.theme_current" 2>/dev/null || echo "charcoal")
WALLPAPER_DIR="$HOME/.config/hypr/themes/$THEME/wallpapers"
INDEX_FILE="/tmp/current_wallpaper_index_${THEME}"

if [ -d "$WALLPAPER_DIR" ] && [ "$(ls -A "$WALLPAPER_DIR" 2>/dev/null)" ]; then
    mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | sort)
    
    if [ ${#WALLPAPERS[@]} -gt 0 ]; then
        if [ -f "$INDEX_FILE" ]; then
            CURRENT_INDEX=$(cat "$INDEX_FILE")
            NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))
        else
            NEXT_INDEX=0
        fi
        
        WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"
        
        # Write modern hyprpaper config
        CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
        cat <<EOF > "$CONFIG_FILE"
splash = false

wallpaper {
    monitor = 
    path = $WALLPAPER
}
EOF
        
        if command -v hyprpaper >/dev/null 2>&1; then
            # Query all active monitors
            MONITORS=$(hyprctl monitors -j 2>/dev/null | grep '"name":' | awk -F '"' '{print $4}' | grep -v '^[0-9]*$' | grep -v '^$')
            
            # Check if hyprpaper is running
            if pgrep -x hyprpaper >/dev/null 2>&1; then
                # Dynamically switch wallpaper without killing process
                APPLIED=false
                if [ -n "$MONITORS" ]; then
                    for mon in $MONITORS; do
                        if hyprctl hyprpaper wallpaper "$mon,$WALLPAPER" 2>/dev/null; then
                            APPLIED=true
                        fi
                    done
                fi
                if [ "$APPLIED" = false ]; then
                    hyprctl hyprpaper wallpaper ",$WALLPAPER" 2>/dev/null || true
                fi
            else
                # Start hyprpaper daemon via Hyprland
                hyprctl dispatch exec hyprpaper 2>/dev/null || hyprpaper &
            fi
        elif command -v swaybg >/dev/null 2>&1; then
            killall swaybg 2>/dev/null
            swaybg -i "$WALLPAPER" -m fill &
        fi
        
        echo "$NEXT_INDEX" > "$INDEX_FILE"
        notify-send "Wallpaper" "Changed to: $(basename "$WALLPAPER")" -i preferences-desktop-wallpaper 2>/dev/null || true
    fi
fi
