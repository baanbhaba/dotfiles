# 🪐 Hyprland Rice v2.0 — Interconnected Desktop Ecosystem

A complete, self-contained, automated Wayland desktop rice built on **Hyprland**, featuring **7 distinct aesthetic themes**, bespoke typography, theme-synchronized audio packs, live Neovim RPC theming, and a Hi-Res FLAC music production suite.

---

## ⚡ 1-Line Quick Installation

Clone the repository and run the automated installer. The installer detects your distribution (Fedora, Arch Linux, Debian/Ubuntu), verifies dependencies, safely backs up existing configs, symlinks all dotfiles, installs typography, and initializes your desktop environment:

```bash
git clone https://github.com/baanbhaba/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

*(or via SSH if your keys are configured: `git clone git@github.com:baanbhaba/dotfiles.git ~/.dotfiles`)*

> [!NOTE]
> Existing configurations in `~/.config/` will **never be overwritten**. The installer creates an automated timestamped backup in `~/.config/dotfiles_backup_<timestamp>/`.

---

## 🎨 7 Interconnected Aesthetic Themes

Every theme is unified across **16+ desktop applications** simultaneously (Hyprland, Waybar, Kitty, Rofi, Neovim, Fastfetch, Btop, Cava, Mako, SwayOSD, Starship, Firefox, Obsidian, Wlogout, `thockd`, and Audio Packs).

| Theme | Aesthetic Vibe | Palette Highlights | Bespoke Typography | Audio Engine |
| :--- | :--- | :--- | :--- | :--- |
| **RetroBoy** | GameBoy DMG 4-shade dot-matrix & RPG HUD | `#8bac0f` `#9bbc0f` `#306230` `#0f380f` | Silkscreen & VT323 | 8-bit chiptune square-wave |
| **NeoBrutalism** | Bold black borders, pop yellow & cyan | `#FFE600` `#00FFFF` `#000000` | Nunito | Physical tactile snap |
| **DarkBrutalism** | Cyberpunk matrix noir, neon terminal green | `#0a0d0c` `#00ff9d` `#1a2621` | JetBrainsMono Nerd Font | Synthetic cyber pulse |
| **Jaipur** | Royal Rajasthani terracotta & desert gold | `#1f1412` `#d97757` `#e5c07b` | Cinzel & Source Code Pro | Warm acoustic timbre |
| **ColorBlock** | Bauhaus / Mondrian modernist pastel geometry | `#1e1e2e` `#f5c2e7` `#89dceb` | Space Grotesk | Soft pop / bubble click |
| **Sketchbook** | Hand-drawn drafting pencil & blueprint lines | `#1c1d21` `#7a88cf` `#cad3f5` | Space Mono | Mechanical pencil on paper |
| **Charcoal** | Monochromatic graphite minimalism & amber glow | `#121212` `#e0af68` `#1e1e1e` | Hack Nerd Font | Heavy mechanical switch |

---

## 🎧 Theme-Synchronized Audio Architecture

Every theme change updates the live sound pack in `~/.config/hypr/sounds/current`:

- **Theme Switcher Sound** (`switch.wav`): Auditory feedback when switching themes.
- **Workspace Transition Sound** (`workspace.wav`): Real-time playback on every workspace switch powered by `workspace_osd.py`.
- **System Actions & Clicks** (`click.wav`): Crisp tactical UI clicks.
- **Lock & Unlock** (`lock.wav`): Interactive Pop Cat Hyprlock sound engine.
- **Screenshot Shutter** (`shutter.wav`): High-definition camera shutter playback.
- **Typing Simulation (`thockd`)**: Switchable typing sound engine (`SUPER + ALT + K`) with custom sound profiles tailored to each theme (e.g. 8-bit for RetroBoy, tactile mechanical switches for Charcoal and NeoBrutalism).

---

## 🎵 Hi-Res FLAC Music Suite

An integrated terminal audio workstation built directly into the rice:

- **Music HUD (`SUPER + ALT + M`)**: Floating desktop visualizer and real-time synchronized karaoke lyrics fetched via Python `syncedlyrics`.
- **Mini Player (`SUPER + CTRL + M`)**: Compact floating desktop widget with play/pause, seek, volume, and cover art.
- **Fuzzy Album / Song Browser (`SUPER + SHIFT + M`)**: Rofi-powered instant search across your entire FLAC library with auto-queueing.
- **Discord Rich Presence (`flac-discord-rpc`)**: Real-time track title, artist, album art, and progress broadcasting to Discord.
- **Parametric EQ Preset Switcher (`rofi-eq`)**: Quick audio profile switcher (Flat, Bass Boost, Vocal, Acoustic).

---

## ⌨️ Keybindings Cheat Sheet

### Core & Application Launchers
| Shortcut | Action |
| :--- | :--- |
| `SUPER + Q` | Kitty Terminal |
| `SUPER + E` | File Manager (Yazi / Dolphin) |
| `SUPER + C` / `SUPER + N` | Neovim Instant Editor |
| `SUPER + ESCAPE` | Rofi Application Launcher |
| `SUPER + R` | Rofi Command Runner |
| `SUPER + M` | Glassmorphic Power Menu (Lock, Suspend, Reboot, Shutdown) |
| `SUPER + W` | Close Active Window |
| `SUPER + V` | Toggle Floating Window |
| `SUPER + F` | Fullscreen Window |
| `SUPER + GRAVE` (`` ` ``) | Toggle Quake-style Terminal Scratchpad |
| `SUPER + SHIFT + V` | Cliphist Clipboard Manager Menu |

### Theming & Display
| Shortcut | Action |
| :--- | :--- |
| `SUPER + SHIFT + T` | **7-Theme Switcher** (Interactive Rofi selector) |
| `SUPER + SHIFT + W` | Cycle Wallpaper for Current Theme |
| `SUPER + CTRL + W` | Wallpaper Manager (Visual Rofi preview grid) |
| `SUPER + SHIFT + N` | Toggle Nightlight (Custom GLSL shader) |
| `SUPER + X` | Toggle Invert Screen Color Shader |
| `SUPER + SHIFT + Z` | Zen Mode (Minimalist focus toggle) |
| `SUPER + SHIFT + A` | Toggle Floating Cava Audio Visualizer |

### FLAC Music & Typing Engine
| Shortcut | Action |
| :--- | :--- |
| `SUPER + ALT + M` | Toggle Music HUD (Lyrics + Visualizer) |
| `SUPER + CTRL + M` | Toggle FLAC Mini Player |
| `SUPER + SHIFT + M` | Rofi Hi-Res FLAC Library Browser |
| `SUPER + ALT + F` | Toggle Favorite Status for Current Track |
| `SUPER + ALT + N` | Skip to Next Song in Queue |
| `SUPER + ALT + P` | Go to Previous Song |
| `SUPER + ALT + K` | Toggle `thockd` Mechanical Typing Audio Daemon |

### Screenshots
| Shortcut | Action |
| :--- | :--- |
| `Print` | Capture Full Screen to Clipboard & Disk |
| `SUPER + SHIFT + S` | Interactive Area Selection Screenshot |
| `ALT + Print` | Capture Active Window |
| `SUPER + Print` | Interactive Screenshot Menu (with delay & upload) |

### Workspace & Window Navigation
| Shortcut | Action |
| :--- | :--- |
| `SUPER + [1-9]` | Switch to Workspace 1–9 |
| `SUPER + SHIFT + [1-9]` | Move Active Window to Workspace 1–9 |
| `SUPER + [Left/Right/Up/Down]` | Focus Window in Direction |
| `SUPER + SHIFT + [Left/Right/Up/Down]` | Move Window Position |
| `SUPER + Left Click + Drag` | Move Floating Window |
| `SUPER + Right Click + Drag` | Resize Window |

---

## 📁 Repository Structure

```text
dotfiles/
├── install.sh             # Fully automated cross-distro installer
├── bin/                   # 40+ Rice & FLAC suite executables (~/.local/bin)
├── fonts/                 # Curated bespoke typography (Silkscreen, VT323, Cinzel, Nunito, Space Grotesk)
├── hypr/
│   ├── hyprland.conf      # Main compositor layout, rules, and keybindings
│   ├── hyprlock.conf      # Pop Cat interactive lockscreen
│   ├── hypridle.conf      # Power management & idle sleep rules
│   ├── scripts/           # Theme switcher, wallpaper engine, workspace OSD
│   ├── shaders/           # Nightlight GLSL shader
│   ├── sounds/            # Theme sound packs (RetroBoy, NeoBrutalism, Charcoal, etc.)
│   └── themes/            # Per-theme Hyprland & Hyprlock configurations & wallpapers
├── waybar/                # Status bar configs & CSS stylesheets for all 7 themes
├── kitty/                 # Terminal config & 7 bespoke font/color theme profiles
├── rofi/                  # Application launcher themes, power menus, network managers
├── nvim/                  # Complete Lua IDE setup, Lazy.nvim, and live theme synchronization
├── mako/                  # Notification daemon stylesheets per theme
├── btop/                  # Resource monitor configs and color themes
├── cava/                  # Audio visualizer styles and shaders
├── fastfetch/             # System information fetch banners per theme
├── swayosd/               # On-screen display styles for brightness/volume
├── starship/              # Starship prompt configurations for all 7 themes
├── thockd/                # Mechanical switch sound profiles (8-bit, tactile, clicky)
├── firefox/               # userChrome.css profiles per theme
├── obsidian-themes/       # Theme stylesheets for Obsidian vaults
└── zsh/                   # Zsh shell configuration (.zshrc)
```

---

## 🛠️ Post-Installation & Verification

1. **First-Time Neovim Launch**:
   Run `nvim` in your terminal. `lazy.nvim` will automatically clone and compile all configured plugins.
2. **Audio Check**:
   Test audio pack playback with `paplay ~/.config/hypr/sounds/current/switch.wav`.
3. **Thockd Typing Permissions**:
   The installer automatically adds your user to the `input` group for `thockd`. If keypress audio does not trigger initially, log out and log back in for group privileges to refresh.

---

## 📄 License
MIT © [baanbhaba](https://github.com/baanbhaba)
