#!/bin/bash

# -----------------------------------------------------
# THEME SWITCHER - Hyprland
# Switch between Charcoal, Jaipur, and Color Block themes
# -----------------------------------------------------

THEMES_DIR="$HOME/.config/hypr/themes"
CURRENT_THEME_FILE="$HOME/.config/hypr/.theme_current"

get_current_theme() {
    if [ -f "$CURRENT_THEME_FILE" ]; then
        cat "$CURRENT_THEME_FILE"
    else
        echo "charcoal"
    fi
}

set_theme() {
    local theme=$1
    echo "$theme" > "$CURRENT_THEME_FILE"
    
    # Hyprland
    ln -sf "$THEMES_DIR/$theme/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
    
    # Hyprlock
    ln -sf "$THEMES_DIR/$theme/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"
    
    # Kitty
    sed -i "s|^include .*|include ~/.config/kitty/themes/$theme.conf|" "$HOME/.config/kitty/kitty.conf"
    
    # Waybar
    ln -sf "$HOME/.config/waybar/themes/$theme/config" "$HOME/.config/waybar/config"
    ln -sf "$HOME/.config/waybar/themes/$theme/style.css" "$HOME/.config/waybar/style.css"
    
    # Mako
    ln -sf "$HOME/.config/mako/themes/$theme" "$HOME/.config/mako/config"
    
    # Btop - use theme name, not path
    sed -i "s|color_theme = .*|color_theme = \"$theme\"|" "$HOME/.config/btop/btop.conf"
    
    # Rofi Theme Sync
    if [ -f "$HOME/.config/rofi/themes/$theme.rasi" ]; then
        ln -sf "$HOME/.config/rofi/themes/$theme.rasi" "$HOME/.config/rofi/config.rasi"
    fi
    
    # Fastfetch Theme Sync
    if [ -f "$HOME/.config/fastfetch/themes/$theme.jsonc" ]; then
        ln -sf "$HOME/.config/fastfetch/themes/$theme.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    fi

    # Cava Audio Visualizer Theme Sync
    if [ -f "$HOME/.config/cava/themes/$theme" ]; then
        ln -sf "$HOME/.config/cava/themes/$theme" "$HOME/.config/cava/config"
    fi

    # SwayOSD Theme Sync
    if [ -f "$HOME/.config/swayosd/themes/$theme.css" ]; then
        ln -sf "$HOME/.config/swayosd/themes/$theme.css" "$HOME/.config/swayosd/style.css"
        systemctl --user restart swayosd.service 2>/dev/null || true
    fi
    
    # Dolphin / KDE Qt Colors Sync
    if command -v plasma-apply-colorscheme >/dev/null 2>&1; then
        case "$theme" in
            "charcoal") plasma-apply-colorscheme CharcoalPitchDark 2>/dev/null || true ;;
            "jaipur") plasma-apply-colorscheme JaipurTerracotta 2>/dev/null || true ;;
            "neobrutalism") plasma-apply-colorscheme NeoBrutalism 2>/dev/null || true ;;
            "darkbrutalism") plasma-apply-colorscheme CharcoalPitchDark 2>/dev/null || true ;;
            "colorblock") plasma-apply-colorscheme ColorBlockPastel 2>/dev/null || true ;;
            "sketchbook") plasma-apply-colorscheme SketchbookPaper 2>/dev/null || true ;;
            "retroboy") plasma-apply-colorscheme CharcoalPitchDark 2>/dev/null || true ;;
        esac
    fi
    
    # 3D Rotating Fetch Theme Sync
    if [ -f "$HOME/.config/fetch/config" ]; then
        case "$theme" in
            "charcoal") sed -i 's/^label_color=.*/label_color=yellow/' "$HOME/.config/fetch/config" ;;
            "jaipur") sed -i 's/^label_color=.*/label_color=red/' "$HOME/.config/fetch/config" ;;
            "neobrutalism") sed -i 's/^label_color=.*/label_color=cyan/' "$HOME/.config/fetch/config" ;;
            "darkbrutalism") sed -i 's/^label_color=.*/label_color=yellow/' "$HOME/.config/fetch/config" ;;
            "colorblock") sed -i 's/^label_color=.*/label_color=yellow/' "$HOME/.config/fetch/config" ;;
            "sketchbook") sed -i 's/^label_color=.*/label_color=white/' "$HOME/.config/fetch/config" ;;
            "retroboy") sed -i 's/^label_color=.*/label_color=green/' "$HOME/.config/fetch/config" ;;
        esac
    fi
    
    # Firefox Theme & Light/Dark Mode Sync
    if [ -x "$HOME/.local/bin/firefox-theme-sync" ]; then
        "$HOME/.local/bin/firefox-theme-sync" "$theme" >/dev/null 2>&1 &
    fi
    
    # Starship Prompt Sync
    if [ -f "$HOME/.config/starship/themes/$theme.toml" ]; then
        ln -sf "$HOME/.config/starship/themes/$theme.toml" "$HOME/.config/starship.toml"
    fi

    # Wlogout Theme Sync
    if [ -f "$HOME/.config/wlogout/themes/$theme.css" ]; then
        ln -sf "$HOME/.config/wlogout/themes/$theme.css" "$HOME/.config/wlogout/style.css"
    fi

    # Obsidian Theme Sync
    if [ -x "$HOME/.local/bin/obsidian-theme-sync" ]; then
        "$HOME/.local/bin/obsidian-theme-sync" "$theme" >/dev/null 2>&1 &
    fi

    # Sound Pack Sync
    if [ -d "$HOME/.config/hypr/sounds/packs/$theme" ]; then
        ln -sfn "$HOME/.config/hypr/sounds/packs/$theme" "$HOME/.config/hypr/sounds/current"
    fi

    # Mechanical Typing Sound Sync (thockd)
    if [ -x "$HOME/.local/bin/thockd" ]; then
        case "$theme" in
            "retroboy") "$HOME/.local/bin/thockd" --profile retroboy 2>/dev/null || true ;;
            "charcoal") "$HOME/.local/bin/thockd" --profile buckling_spring 2>/dev/null || true ;;
            "neobrutalism"|"darkbrutalism") "$HOME/.local/bin/thockd" --profile creamy_thock 2>/dev/null || true ;;
            "jaipur") "$HOME/.local/bin/thockd" --profile buckling_spring 2>/dev/null || true ;;
            "colorblock"|"sketchbook") "$HOME/.local/bin/thockd" --profile silent_alpaca 2>/dev/null || true ;;
        esac
    fi
    
    reload_all
    # Restart btop
    pkill btop 2>/dev/null || true
}

reload_all() {
    # Restart btop
    pkill btop 2>/dev/null || true
    hyprctl reload
    killall waybar 2>/dev/null
    sleep 0.2
    hyprctl dispatch exec waybar
    makoctl reload 2>/dev/null || (killall mako 2>/dev/null && mako &)
    pkill -SIGUSR1 kitty 2>/dev/null
    # Live reload running Neovim instances
    for sock in $(find /run/user/$(id -u) /tmp -name "nvim*" -type s 2>/dev/null); do
        nvim --server "$sock" --remote-send '<Cmd>ThemeSync<CR>' 2>/dev/null || true
    done
    ~/.config/hypr/scripts/wallpaper.sh
    local cur_name=$(get_current_theme)
    notify-send "Theme Switcher" "Switched to ${cur_name^^} theme" -i color-select 2>/dev/null || true
    if [ ! -f "$HOME/.config/hypr/.sounds_muted" ]; then
        if [ -f "$HOME/.config/hypr/sounds/current/switch.wav" ]; then
            paplay "$HOME/.config/hypr/sounds/current/switch.wav" 2>/dev/null &
        else
            paplay "$HOME/.config/hypr/sounds/chime.wav" 2>/dev/null &
        fi
    fi
}

show_menu() {
    local current=$(get_current_theme)
    local options="Charcoal\nNeoBrutalism\nDarkBrutalism\nJaipur\nColorBlock\nSketchbook\nRetroBoy"
    
    local rofi_theme="$HOME/.config/rofi/themes/${current}.rasi"
    if [ ! -f "$rofi_theme" ]; then
        rofi_theme="$HOME/.config/rofi/themes/charcoal.rasi"
    fi
    
    local chosen=$(echo -e "$options" | rofi -dmenu -i -p "Select Theme" -theme "$rofi_theme")
    
    case "$chosen" in
        "Charcoal") set_theme "charcoal" ;;
        "NeoBrutalism") set_theme "neobrutalism" ;;
        "DarkBrutalism") set_theme "darkbrutalism" ;;
        "Jaipur") set_theme "jaipur" ;;
        "ColorBlock") set_theme "colorblock" ;;
        "Sketchbook") set_theme "sketchbook" ;;
        "RetroBoy") set_theme "retroboy" ;;
        *) exit 0 ;;
    esac
}

if [ "$1" = "--set" ] && [ -n "$2" ]; then
    if [ -d "$THEMES_DIR/$2" ]; then
        set_theme "$2"
    else
        echo "Theme '$2' not found"
        exit 1
    fi
else
    show_menu
fi
