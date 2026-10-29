#!/usr/bin/env bash
# ==============================================================================
#  🪐 HYPRLAND RICE V2.0 - AUTOMATED ECOSYSTEM INSTALLER
# ==============================================================================
#  Repository: https://github.com/baanbhaba/dotfiles
#  Author:     baanbhaba
#  Description: Fully automated setup for a 7-theme interconnected Hyprland
#               desktop environment, bespoke fonts, dynamic audio packs,
#               Neovim IDE, FLAC Hi-Res music suite, and custom rice utilities.
# ==============================================================================

set -euo pipefail

# --- Color Codes & Styling ---
BOLD='\033[1m'
RESET='\033[0m'
RED='\033[38;2;255;92;87m'
GREEN='\033[38;2;90;247;142m'
YELLOW='\033[38;2;243;249;157m'
BLUE='\033[38;2;87;199;255m'
PURPLE='\033[38;2;255;106;193m'
CYAN='\033[38;2;154;237;254m'
DIM='\033[2m'

# --- Output Helpers ---
info()    { echo -e "  ${BLUE}ℹ${RESET}  $1"; }
success() { echo -e "  ${GREEN}✓${RESET}  ${BOLD}$1${RESET}"; }
warn()    { echo -e "  ${YELLOW}⚠${RESET}  $1"; }
error()   { echo -e "  ${RED}✖${RESET}  ${BOLD}$1${RESET}"; }
step()    { echo -e "\n${PURPLE}▶${RESET} ${BOLD}$1${RESET}"; }

# --- Banner ---
clear
echo -e "${CYAN}${BOLD}"
cat << "EOF"
  ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
  ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
  ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
  ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
  ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
  ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
EOF
echo -e "         ${YELLOW}✦ 7-Theme Interconnected Rice Ecosystem & Audio Suite ✦${RESET}\n"

# --- Safety & Privilege Verification ---
if [ "${EUID:-$(id -u)}" -eq 0 ]; then
    error "Please do not execute this installer as root or with 'sudo ./install.sh'."
    info  "Run as your regular user: './install.sh'. The script will prompt for sudo when necessary."
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_DIR="$HOME/.config/dotfiles_backup_${BACKUP_TIMESTAMP}"

step "Checking administrative privileges..."
sudo -v

# Keep sudo timestamp updated in the background
while true; do
    sudo -n true
    sleep 45
    kill -0 "$$" 2>/dev/null || exit
done 2>/dev/null &
SUDO_KEEP_ALIVE_PID=$!
trap 'kill "$SUDO_KEEP_ALIVE_PID" 2>/dev/null || true' EXIT INT TERM

success "Sudo privileges authenticated."

# --- Distro Detection ---
step "Detecting Linux Distribution & Package Manager..."

DISTRO_ID="unknown"
if [ -f /etc/os-release ]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    DISTRO_ID="${ID:-unknown}"
fi

info "Detected Distribution: ${BOLD}${DISTRO_ID}${RESET} (${PRETTY_NAME:-Linux})"

# --- Package Matrix Installation ---
step "Installing Core Desktop Ecosystem & Dependencies..."

case "$DISTRO_ID" in
    fedora)
        info "Configuring & installing packages via DNF..."
        FEDORA_PKGS=(
            hyprland hyprlock hypridle hyprpaper
            waybar rofi-wayland kitty mako cava btop fastfetch
            swayosd wlogout playerctl pipewire wireplumber
            pulseaudio-utils alsa-utils wl-clipboard cliphist
            grim slurp jq libnotify ImageMagick socat
            zsh git neovim curl wget
            python3 python3-pip python3-pillow python3-pygame python3-evdev
        )
        sudo dnf install -y "${FEDORA_PKGS[@]}"
        ;;

    arch|manjaro|endeavouros|cachyos)
        info "Configuring & installing packages via Pacman..."
        ARCH_PKGS=(
            hyprland hyprlock hypridle hyprpaper
            waybar rofi-wayland kitty mako cava btop fastfetch
            playerctl pipewire wireplumber libpulse alsa-utils
            wl-clipboard cliphist grim slurp jq libnotify
            imagemagick socat zsh git neovim curl wget
            python python-pip python-pillow python-pygame python-evdev
        )
        sudo pacman -Sy --noconfirm --needed "${ARCH_PKGS[@]}"

        # AUR Helper Detection for SwayOSD & Wlogout
        AUR_HELPER=""
        if command -v yay &>/dev/null; then
            AUR_HELPER="yay"
        elif command -v paru &>/dev/null; then
            AUR_HELPER="paru"
        fi

        if [ -n "$AUR_HELPER" ]; then
            info "Installing SwayOSD and Wlogout via $AUR_HELPER..."
            $AUR_HELPER -S --noconfirm --needed swayosd-git wlogout || warn "Could not build some AUR packages. Continuing..."
        else
            warn "No AUR helper (yay/paru) found. If SwayOSD or Wlogout are missing, install them from AUR."
        fi
        ;;

    debian|ubuntu|pop|linuxmint)
        info "Configuring & installing packages via APT..."
        sudo apt update -y
        DEBIAN_PKGS=(
            hyprland waybar rofi-wayland kitty mako-notifier
            btop fastfetch playerctl pipewire wireplumber
            pulseaudio-utils alsa-utils wl-clipboard grim slurp
            jq libnotify-bin imagemagick socat zsh git neovim
            curl wget python3 python3-pip python3-pil python3-pygame python3-evdev
        )
        sudo apt install -y "${DEBIAN_PKGS[@]}" || warn "Some APT packages failed to install. Please check repositories."
        ;;

    *)
        warn "Unsupported or custom distribution '$DISTRO_ID'."
        info "Please ensure Hyprland, Waybar, Rofi, Kitty, Mako, Cava, Btop, and Python3 libraries are installed."
        ;;
esac
success "Core system packages synchronized."

# --- Python Lyrics Engine for FLAC Suite ---
step "Configuring Python Dependencies..."
if ! python3 -c "import syncedlyrics" 2>/dev/null; then
    info "Installing 'syncedlyrics' for automated Hi-Res FLAC lyric fetching..."
    pip3 install --user --break-system-packages syncedlyrics 2>/dev/null || \
    pip3 install --user syncedlyrics 2>/dev/null || \
    warn "Failed to pip install syncedlyrics. You can install it manually later via 'pip install syncedlyrics'."
else
    success "Python 'syncedlyrics' library is already installed."
fi

# --- CLI Productivity Utilities (Starship & Zoxide) ---
step "Setting up Terminal Prompt & Jump Tools (Starship & Zoxide)..."
mkdir -p "$HOME/.local/bin"

if ! command -v starship &>/dev/null && [ ! -f "$HOME/.local/bin/starship" ]; then
    info "Installing Starship cross-shell prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin" || warn "Starship install script had an issue."
fi

if ! command -v zoxide &>/dev/null && [ ! -f "$HOME/.local/bin/zoxide" ]; then
    info "Installing Zoxide smart directory jumper..."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh || warn "Zoxide install script had an issue."
fi

# --- Bespoke Fonts Installation ---
step "Installing Bespoke Rice Typography..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

if [ -d "$DOTFILES_DIR/fonts" ]; then
    info "Copying curated fonts to $FONT_DIR..."
    cp -rn "$DOTFILES_DIR/fonts/"* "$FONT_DIR/" 2>/dev/null || cp -r "$DOTFILES_DIR/fonts/"* "$FONT_DIR/"
    info "Updating system font cache..."
    fc-cache -fv > /dev/null 2>&1
    success "Installed VT323, Silkscreen, Space Grotesk, Space Mono, Cinzel, Nunito, Hack, and JetBrainsMono Nerd Fonts!"
else
    warn "Fonts directory not found at $DOTFILES_DIR/fonts. Skipping font installation."
fi

# --- Safe Configuration Backup & Symlinking ---
step "Synchronizing Dotfiles & Backing Up Existing Configurations..."

CONFIG_DIRS=(
    hypr
    waybar
    kitty
    rofi
    mako
    btop
    cava
    fastfetch
    swayosd
    starship
    wlogout
    firefox
    obsidian-themes
    thockd
    nvim
)

mkdir -p "$HOME/.config"
BACKED_UP_ANY=false

for cfg in "${CONFIG_DIRS[@]}"; do
    TARGET="$HOME/.config/$cfg"
    SOURCE="$DOTFILES_DIR/$cfg"

    if [ -d "$SOURCE" ]; then
        if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
            if [ "$BACKED_UP_ANY" = false ]; then
                mkdir -p "$BACKUP_DIR"
                BACKED_UP_ANY=true
            fi
            info "Backing up existing $TARGET to $BACKUP_DIR/$cfg..."
            mv "$TARGET" "$BACKUP_DIR/$cfg"
        fi

        # Link configuration folder
        ln -sfn "$SOURCE" "$TARGET"
        echo -e "    ${DIM}Linked:${RESET} ~/.config/$cfg ${DIM}→${RESET} $SOURCE"
    fi
done

# Starship active link
if [ -d "$HOME/.config/starship/themes" ]; then
    ln -sf "$HOME/.config/starship/themes/retroboy.toml" "$HOME/.config/starship.toml"
fi

# Shell configuration
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
        if [ "$BACKED_UP_ANY" = false ]; then
            mkdir -p "$BACKUP_DIR"
            BACKED_UP_ANY=true
        fi
        mv "$HOME/.zshrc" "$BACKUP_DIR/.zshrc"
    fi
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo -e "    ${DIM}Linked:${RESET} ~/.zshrc ${DIM}→${RESET} $DOTFILES_DIR/zsh/.zshrc"
fi

if [ "$BACKED_UP_ANY" = true ]; then
    success "Existing configurations were safely preserved in $BACKUP_DIR"
fi
success "All dotfiles symlinked cleanly into ~/.config."

# --- Custom Binaries & Rice Tools ---
step "Deploying Rice Binaries & Scripts to ~/.local/bin..."
mkdir -p "$HOME/.local/bin"

if [ -d "$DOTFILES_DIR/bin" ]; then
    chmod +x "$DOTFILES_DIR/bin/"* 2>/dev/null || true
    for script in "$DOTFILES_DIR/bin/"*; do
        if [ -f "$script" ]; then
            sname="$(basename "$script")"
            ln -sf "$script" "$HOME/.local/bin/$sname"
        fi
    done
    success "Linked $(ls -1 "$DOTFILES_DIR/bin" | wc -l) executables into ~/.local/bin/."
fi

# Ensure Hyprland scripts have execution bits
if [ -d "$DOTFILES_DIR/hypr/scripts" ]; then
    chmod +x "$DOTFILES_DIR/hypr/scripts/"* 2>/dev/null || true
fi

# --- Hardware Permissions & Services ---
step "Configuring User Groups & Services..."

# Add user to input group for thockd (mechanical switch typing simulation)
if ! groups "$USER" | grep &>/dev/null '\binput\b'; then
    info "Adding user '$USER' to 'input' group for thockd evdev keyboard simulation..."
    sudo usermod -aG input "$USER" || warn "Could not add user to input group."
    warn "Note: You will need to log out and back in for the 'input' group change to take effect."
else
    success "User '$USER' is already a member of the 'input' group."
fi

# SwayOSD service
if command -v swayosd-server &>/dev/null; then
    info "Enabling SwayOSD user service..."
    systemctl --user daemon-reload 2>/dev/null || true
    systemctl --user enable --now swayosd.service 2>/dev/null || true
fi

# --- Neovim Lazy.nvim Bootstrap ---
step "Bootstrapping Neovim Plugin Architecture..."
LAZY_NVIM_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_NVIM_PATH" ]; then
    info "Cloning lazy.nvim package manager..."
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_NVIM_PATH"
    success "lazy.nvim bootstrapped. Neovim will sync all plugins on first launch!"
else
    success "lazy.nvim is already initialized."
fi

# --- Theme Initialization ---
step "Initializing Default Ecosystem Theme (RetroBoy)..."
if [ -f "$HOME/.config/hypr/scripts/theme_switcher.sh" ]; then
    "$HOME/.config/hypr/scripts/theme_switcher.sh" --set retroboy || true
    success "Default theme activated: RetroBoy (GameBoy DMG 4-shade aesthetic & 8-bit sound pack)"
else
    warn "theme_switcher.sh not found. Skipping initial theme apply."
fi

# ==============================================================================
#  INSTALLATION COMPLETE - SUMMARY
# ==============================================================================
echo -e "\n${GREEN}${BOLD}========================================================================${RESET}"
echo -e "${GREEN}${BOLD}       🪐 HYPRLAND RICE ECOSYSTEM SUCCESSFULLY INSTALLED!              ${RESET}"
echo -e "${GREEN}${BOLD}========================================================================${RESET}\n"

echo -e "${BOLD}🎨 7 Interconnected Aesthetic Themes Ready:${RESET}"
echo -e "   ${GREEN}1. RetroBoy${RESET}       - GameBoy DMG dot-matrix, RPG HUD, 8-bit audio pack & pixel typography"
echo -e "   ${DIM}2. Charcoal${RESET}       - Monochromatic architectural minimalism, Hack font, mechanical switch"
echo -e "   ${YELLOW}3. NeoBrutalism${RESET}   - High-contrast black outlines, electric yellow/cyan, tactile physical audio"
echo -e "   ${CYAN}4. DarkBrutalism${RESET}  - Cyberpunk matrix noir, JetBrainsMono, synthetic digital audio"
echo -e "   ${RED}5. Jaipur${RESET}         - Royal Rajasthani terracotta & desert gold, Cinzel, acoustic audio"
echo -e "   ${PURPLE}6. ColorBlock${RESET}     - Bauhaus/Mondrian modernist geometry, Space Grotesk, bubble pop audio"
echo -e "   ${RESET}7. Sketchbook${RESET}     - Hand-drawn pencil drafting on paper, Space Mono, mechanical pencil audio"

echo -e "\n${BOLD}⌨️  Key Shortcuts Cheat Sheet:${RESET}"
echo -e "   ${CYAN}SUPER + ESCAPE${RESET}   / ${CYAN}SUPER + R${RESET}    : Rofi App Launcher / Run Dialog"
echo -e "   ${CYAN}SUPER + SHIFT + T${RESET}            : Interactive 7-Theme Switcher"
echo -e "   ${CYAN}SUPER + SHIFT + W${RESET}            : Cycle Themed Wallpapers"
echo -e "   ${CYAN}SUPER + CTRL + W${RESET}             : Visual Wallpaper Manager (Rofi Grid)"
echo -e "   ${CYAN}SUPER + SHIFT + S${RESET}            : Area Screenshot Tool"
echo -e "   ${CYAN}SUPER + ALT + M${RESET}              : Floating Music HUD (Synchronized Lyrics + Visualizer)"
echo -e "   ${CYAN}SUPER + CTRL + M${RESET}             : FLAC Mini Desktop Player"
echo -e "   ${CYAN}SUPER + SHIFT + M${RESET}            : Hi-Res FLAC Album Browser"
echo -e "   ${CYAN}SUPER + ALT + K${RESET}              : Toggle Mechanical Typing Sound Engine (thockd)"
echo -e "   ${CYAN}SUPER + M${RESET}                    : Glassmorphic Power Menu (Lock/Suspend/Reboot/Shutdown)"
echo -e "   ${CYAN}SUPER + Q${RESET}                    : Launch Kitty Terminal"
echo -e "   ${CYAN}SUPER + E${RESET}                    : Launch File Manager (Yazi/Dolphin)"
echo -e "   ${CYAN}SUPER + C${RESET}                    : Open Neovim Instant Editor"

echo -e "\n${YELLOW}${BOLD}Next Steps:${RESET}"
echo -e "   1. Log out or reboot your system."
echo -e "   2. At your display manager (SDDM/GDM), select the ${BOLD}Hyprland${RESET} session."
echo -e "   3. Launch Neovim (${CYAN}nvim${RESET}) to let Lazy sync all plugins automatically."
echo -e "   4. Enjoy your supreme desktop experience! 🚀\n"
