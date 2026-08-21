local config = {}

-- MONITORS
config.monitors = {
    { name = "", resolution = "highrr", position = "auto", scale = 1 }
}

-- PROGRAMS & CONSTANTS
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun -theme ~/.config/rofi/config.rasi"
local run = "rofi -show run -theme ~/.config/rofi/config.rasi"
local powermenu = "~/.config/rofi/powermenu.sh"
local mainMod = "SUPER"

-- AUTOSTART
config.exec_once = {
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY",
    "~/.config/mako/battery-check.sh &",
    "systemctl --user start hyprpolkitagent",
    "mako &",
    "waybar &",
    "swayosd-server &",
    "nm-applet --indicator &",
    "blueman-applet &",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
    "~/.config/hypr/scripts/battery_check.sh &"
}

-- INPUT & GESTURES
config.devices = {
    { name = "synps/2-synaptics-touchpad", sensitivity = -0.1 }
}

config.input = {
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = -0.7,
    touchpad = {
        natural_scroll = true
    }
}

-- GENERAL LAYOUT
config.general = {
    gaps_in = 2,
    gaps_out = 4,
    border_size = 1,
    col_active_border = "rgb(ffb000)",
    col_inactive_border = "rgb(262626)",
    layout = "dwindle",
    allow_tearing = false
}

-- DECORATION & EFFECTS
config.decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 0.85,
    shadow = {
        enabled = true,
        range = 0,
        color = "rgba(ffb00022)"
    },
    blur = {
        enabled = true,
        size = 2,
        passes = 1,
        new_optimizations = true,
        xray = true
    }
}

-- ANIMATIONS
config.animations = {
    enabled = true,
    beziers = {
        { name = "myBezier", p1 = 0.05, p2 = 0.9, p3 = 0.1, p4 = 1.05 }
    },
    animations = {
        { name = "windows", enabled = 1, speed = 2, curve = "myBezier" },
        { name = "windowsOut", enabled = 1, speed = 2, curve = "default", style = "popin 50%" },
        { name = "border", enabled = 1, speed = 2, curve = "default" },
        { name = "fade", enabled = 1, speed = 2, curve = "default" },
        { name = "workspaces", enabled = 1, speed = 2, curve = "default" }
    }
}

-- WINDOW RULES (v0.55 Bracket Format)
config.windowrules = {
    {
        name = "system_popups",
        match = { class = "^(nm-connection-editor|org.pulseaudio.pavucontrol|blueman-manager|pavucontrol)$" },
        properties = {
            float = true,
            pin = true,
            size = "400 500",
            move = "cursor -200 -250"
        }
    }
}

-- KEYBINDINGS
config.binds = {
    -- Applications & Actions
    { mod = mainMod, key = "Q", action = "exec", arg = terminal },
    { mod = mainMod, key = "W", action = "killactive" },
    { mod = mainMod, key = "M", action = "exec", arg = "~/.config/hypr/scripts/powermenu.sh" },
    { mod = mainMod, key = "E", action = "exec", arg = fileManager },
    { mod = mainMod, key = "V", action = "togglefloating" },
    { mod = mainMod, key = "P", action = "pseudo" },
    { mod = mainMod, key = "J", action = "layoutmsg", arg = "togglesplit" },
    { mod = mainMod, key = "F", action = "fullscreen" },
    { mod = mainMod, key = "ESCAPE", action = "exec", arg = menu },
    { mod = mainMod, key = "R", action = "exec", arg = run },
    { mod = mainMod, key = "Z", action = "fullscreenstate", arg = "0 1" },
    { mod = mainMod, key = "X", action = "exec", arg = "~/.local/bin/toggle-invert" },

    -- Focus Navigation
    { mod = mainMod, key = "left", action = "movefocus", arg = "l" },
    { mod = mainMod, key = "right", action = "movefocus", arg = "r" },
    { mod = mainMod, key = "up", action = "movefocus", arg = "u" },
    { mod = mainMod, key = "down", action = "movefocus", arg = "d" },

    -- Window Movement
    { mod = mainMod .. " SHIFT", key = "left", action = "movewindow", arg = "l" },
    { mod = mainMod .. " SHIFT", key = "right", action = "movewindow", arg = "r" },
    { mod = mainMod .. " SHIFT", key = "up", action = "movewindow", arg = "u" },
    { mod = mainMod .. " SHIFT", key = "down", action = "movewindow", arg = "d" },

    -- Workspace Switching
    { mod = mainMod, key = "1", action = "workspace", arg = "1" },
    { mod = mainMod, key = "2", action = "workspace", arg = "2" },
    { mod = mainMod, key = "3", action = "workspace", arg = "3" },
    { mod = mainMod, key = "4", action = "workspace", arg = "4" },
    { mod = mainMod, key = "5", action = "workspace", arg = "5" },
    { mod = mainMod, key = "6", action = "workspace", arg = "6" },
    { mod = mainMod, key = "7", action = "workspace", arg = "7" },
    { mod = mainMod, key = "8", action = "workspace", arg = "8" },
    { mod = mainMod, key = "9", action = "workspace", arg = "9" },

    -- Move Window to Workspace
    { mod = mainMod .. " SHIFT", key = "1", action = "movetoworkspace", arg = "1" },
    { mod = mainMod .. " SHIFT", key = "2", action = "movetoworkspace", arg = "2" },
    { mod = mainMod .. " SHIFT", key = "3", action = "movetoworkspace", arg = "3" },
    { mod = mainMod .. " SHIFT", key = "4", action = "movetoworkspace", arg = "4" },
    { mod = mainMod .. " SHIFT", key = "5", action = "movetoworkspace", arg = "5" },
    { mod = mainMod .. " SHIFT", key = "6", action = "movetoworkspace", arg = "6" },
    { mod = mainMod .. " SHIFT", key = "7", action = "movetoworkspace", arg = "7" },
    { mod = mainMod .. " SHIFT", key = "8", action = "movetoworkspace", arg = "8" },
    { mod = mainMod .. " SHIFT", key = "9", action = "movetoworkspace", arg = "9" },

    -- Mouse Bindings
    { type = "bindm", mod = mainMod, key = "mouse:272", action = "movewindow" },
    { type = "bindm", mod = mainMod, key = "mouse:273", action = "resizewindow" },

    -- Hardware Controls
    { type = "bindel", mod = "", key = "XF86AudioRaiseVolume", action = "exec", arg = "swayosd-client --output-volume raise" },
    { type = "bindel", mod = "", key = "XF86AudioLowerVolume", action = "exec", arg = "swayosd-client --output-volume lower" },
    { type = "bindl", mod = "", key = "XF86AudioMute", action = "exec", arg = "swayosd-client --output-volume mute-toggle" },
    { type = "bindel", mod = "", key = "XF86MonBrightnessUp", action = "exec", arg = "swayosd-client --brightness raise" },
    { type = "bindel", mod = "", key = "XF86MonBrightnessDown", action = "exec", arg = "swayosd-client --brightness lower" },

    -- Screenshots
    { mod = "", key = "Print", action = "exec", arg = 'grim -g "$(slurp)" - | wl-copy' },
    { mod = mainMod .. " SHIFT", key = "S", action = "exec", arg = "grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S').png" },

    -- Misc Keybindings
    { mod = mainMod .. " SHIFT", key = "W", action = "exec", arg = "~/.config/hypr/scripts/wallpaper.sh" },
    { mod = mainMod .. " SHIFT", key = "T", action = "exec", arg = "~/.config/hypr/scripts/theme_switcher.sh" }
}

-- MISC, DEBUG & LAYOUT SETTINGS
config.misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    background_color = "0x000000",
    disable_splash_rendering = true
}

config.debug = {
    vfr = true
}

config.dwindle = {
    preserve_split = true
}

return config
