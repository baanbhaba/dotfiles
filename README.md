# 🪐 Dotfiles

Personal Wayland / Hyprland configuration and desktop environment setup for **baanbhaba**.

---

## 🎨 Themes Included
- **Charcoal**: Minimalist dark with amber accents
- **Jaipur**: Warm terracotta & earth tones
- **Color Block**: Muted pastel palette

---

## 📁 Repository Structure

```text
dotfiles/
├── hypr/          # Hyprland compositor configs, multi-theme layouts, scripts, shaders
├── waybar/        # Status bar configurations & CSS styling per theme
├── kitty/         # Terminal emulator configuration & color schemes
├── rofi/          # Application launcher, power menu & themes
├── mako/          # Notification daemon styling
├── nvim/          # Neovim (Lua) IDE setup & plugin lockfile
├── btop/          # Resource monitor configuration & themes
├── fastfetch/     # System info fetch banner
├── cava/          # Audio visualizer configurations & shaders
├── bin/           # Custom utility scripts (invert shader, color picker, workspace switcher)
└── zsh/           # Zsh shell configuration (.zshrc)
```

---

## 🛠️ Keybindings Quick Reference

| Shortcut | Action |
| :--- | :--- |
| `SUPER + Q` | Open Kitty Terminal |
| `SUPER + E` | Open Dolphin File Manager |
| `SUPER + ESCAPE` | Open Rofi App Launcher |
| `SUPER + R` | Open Rofi Run Menu |
| `SUPER + M` | Open Power Menu |
| `SUPER + W` | Close Active Window |
| `SUPER + V` | Toggle Floating Window |
| `SUPER + F` | Toggle Fullscreen |
| `SUPER + X` | Toggle Invert Screen Shader |
| `SUPER + SHIFT + W` | Cycle Wallpaper |
| `SUPER + SHIFT + T` | Open Theme Switcher |
| `SUPER + SHIFT + S` | Interactive Screenshot Selection |
| `Print` | Copy Screenshot to Clipboard |
| `SUPER + [1-9]` | Switch Workspace |
| `SUPER + SHIFT + [1-9]` | Move Window to Workspace |

---

## 🚀 Quick Setup / Installation

Symlink configs to `~/.config/`:
```bash
# Clone
git clone git@github.com:baanbhaba/dotfiles.git ~/dotfiles

# Hyprland, Waybar, Kitty, Rofi, Mako
ln -sfn ~/dotfiles/hypr ~/.config/hypr
ln -sfn ~/dotfiles/waybar ~/.config/waybar
ln -sfn ~/dotfiles/kitty ~/.config/kitty
ln -sfn ~/dotfiles/rofi ~/.config/rofi
ln -sfn ~/dotfiles/mako ~/.config/mako
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/btop ~/.config/btop
ln -sfn ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sfn ~/dotfiles/cava ~/.config/cava

# Shell
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
```
