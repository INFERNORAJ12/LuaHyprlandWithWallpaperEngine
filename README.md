# 🪟 LuaHyprlandWithWallpaperEngine

A clean, aesthetic, and functional [Hyprland](https://hyprland.org/) configuration tailored for a smooth tiling window manager experience on Linux, managed via **UWSM** (Universal Wayland Session Manager) and powered by **Wallpaper Engine**.

---

## ✨ Features

- **Dynamic Tiling:** Responsive and intuitive window management via Hyprland.
- **Fluid Animations:** Carefully tuned bezier curves, window physics, and active borders.
- **Live Wallpapers:** Native Wallpaper Engine integration via `linux-wallpaperengine`.
- **Streamlined Workflow:** Ergonomic keybindings for rapid workspace switching and app launching.
- **Modular Config:** Workspace assignment rules (e.g., launching Steam on dedicated workspaces) ready to enable out of the box.

---

## 📋 Prerequisites

Before setting up the configuration, ensure you have the following installed:

1. **Hyprland & UWSM:** A functional base Hyprland session running through UWSM.
2. **Steam (Legitimate Copy):** An active Steam account owning [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine/).  
   > ⚠️ **Note:** Unofficial or cracked copies of Wallpaper Engine are **not supported**.
3. **`linux-wallpaperengine`:** The background daemon for running Wallpaper Engine assets on Wayland/X11.

---

## ⚙️ Installation

### 1. Install `linux-wallpaperengine`

Install the latest build from the Arch User Repository (AUR) using your preferred helper:

**Using `yay`:**
```bash
yay -S linux-wallpaperengine-git
