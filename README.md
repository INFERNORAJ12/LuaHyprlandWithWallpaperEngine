<div align="center">

# 🪟 LuaHyprlandWithWallpaperEngine

**A clean, aesthetic, and functional Hyprland configuration tailored for a smooth tiling window manager experience on Linux, managed via UWSM and powered by Wallpaper Engine.**

[![Hyprland](https://img.shields.io/badge/Compositor-Hyprland-00c8ff?style=for-the-badge&logo=hyprland&logoColor=white)](https://hyprland.org/)
[![Session Manager](https://img.shields.io/badge/Session-UWSM-blueviolet?style=for-the-badge)](https://github.com/Vladimir-csp/uwsm)
[![AUR](https://img.shields.io/badge/AUR-linux--wallpaperengine--git-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://aur.archlinux.org/packages/linux-wallpaperengine-git)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](#-credits--upstream)

</div>

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Key Features](#-key-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Install Linux Wallpaper Engine](#2-install-linux-wallpaper-engine)
- [Configuration & Setup](#-configuration--setup)
  - [1. Monitor Refresh Rate (Critical)](#1-set-your-display-refresh-rate-critical)
  - [2. Activating Wallpapers (`Wallpaper.lua`)](#2-activate-wallpapers-wallpaperlua)
  - [3. Workspace Rules (Steam Setup)](#3-workspace-rules--steam-autostart)
- [Keybindings Reference](#-keybindings-reference)
- [Troubleshooting](#-troubleshooting)
- [Credits & Upstream](#-credits--upstream)

---

## 🔭 Overview

**LuaHyprlandWithWallpaperEngine** delivers a polished, responsive desktop environment utilizing **Hyprland** managed through **UWSM** (Universal Wayland Session Manager) for clean systemd-integrated session management. Live animated wallpapers are supported natively via `linux-wallpaperengine`, bringing your favorite Steam Workshop wallpapers directly to your Linux setup.

---

## ✨ Key Features

- **Dynamic Tiling:** Intuitive, fast window auto-tiling powered by [Hyprland](https://hyprland.org/).
- **Native Live Wallpapers:** Full 2D/3D & web-based wallpaper support via `linux-wallpaperengine`.
- **Robust Session Handling:** Integrates with [UWSM](https://github.com/Vladimir-csp/uwsm) for environment variable preservation and clean process teardown.
- **Fluid Visuals & Physics:** Hand-crafted animations, smooth bezier curves, and dynamic active window borders.
- **Modular Workflow:** Easily customizable Lua configuration files with dedicated workspace routing (e.g., launching Steam on a designated workspace).

---

## 📦 Prerequisites

Before proceeding, make sure your system satisfies the following requirements:

1. **Linux Distribution:** Arch Linux (or any Arch-based distribution).
2. **Wayland Compositor:** Hyprland managed via `uwsm`.
3. **Steam:** A working, legitimate Steam installation.
4. **Wallpaper Engine:** A legally purchased copy of [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine/) in your Steam library.  
   > ⚠️ **Important:** Cracked, pirate, or unlinked offline copies will **not** work with the background engine.

---

## 🚀 Installation

### 1. Clone the Repository

Clone this configuration into your Hyprland user configuration folder:

```bash
git clone https://github.com/your-username/LuaHyprlandWithWallpaperEngine.git ~/.config/hypr
```

---

### 2. Install Linux Wallpaper Engine

Install `linux-wallpaperengine` from the Arch User Repository (AUR) using your preferred AUR helper.

#### Using `yay`:
```bash
yay -S linux-wallpaperengine-git
```

#### Using `paru`:
```bash
paru -S linux-wallpaperengine-git
```

#### Manual Build (Fallback)
If your AUR helper encounters errors, add `sudo` or compile upstream manually:

```bash
git clone --recurse-submodules https://github.com/Almamu/linux-wallpaperengine.git
cd linux-wallpaperengine
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```
*(For detailed compilation dependencies, visit the [official upstream repository](https://github.com/Almamu/linux-wallpaperengine).)*

---

## ⚙️ Configuration & Setup

### 1. Set Your Display Refresh Rate (Critical!)

> ⚠️ **Important:** You **must** configure your display's refresh rate accurately. If the refresh rate is omitted or incorrect, the wallpaper engine will fail to render and output a black screen.

1. Open your monitor configuration:
   ```bash
   nano ~/.config/hypr/config/monitors.conf
   ```
2. Specify your display's native output, resolution, and refresh rate:
   ```ini
   # monitor = [PORT],[WIDTHxHEIGHT@REFRESH_RATE],[OFFSET],[SCALE]
   monitor = DP-1, 1920x1080@144, 0x0, 1
   ```

---

### 2. Activate Wallpapers (`Wallpaper.lua`)

Wallpapers are executed via `Wallpaper.lua`.

1. Open the file in your preferred editor:
   ```bash
   nano ~/.config/hypr/config/Wallpaper.lua
   ```
2. **Uncomment** the desired wallpaper engine command line(s):
   ```lua
   -- Example: uncomment and replace with your workshop item ID or asset path
   os.execute("linux-wallpaperengine --screen-root DP-1 431960/your_workshop_id &")
   ```
3. You can add or duplicate commands for multi-monitor setups or custom assets.

---

### 3. Workspace Rules & Steam Autostart

Rules for launching specific applications on dedicated workspaces are provided in the config and commented out by default.

1. Open your window rules configuration:
   ```bash
   nano ~/.config/hypr/config/windowrules.conf
   ```
2. Locate and uncomment the Steam assignment lines:
   ```ini
   windowrulev2 = workspace 5 silent, class:^(steam)$
   windowrulev2 = workspace 5 silent, title:^(Steam)$
   ```

---

## ⌨️ Common Keybindings

| Key Combination | Action | Description |
| :--- | :--- | :--- |
| `SUPER + Q` | Close Window | Kills the currently focused window |
| `SUPER + RETURN` | Terminal | Opens the terminal emulator |
| `SUPER + SPACE` | App Launcher | Launches the application menu |
| `SUPER + E` | File Manager | Launches default file manager |
| `SUPER + 1 - 9` | Workspace Switch | Switches active workspace |
| `SUPER + SHIFT + 1 - 9` | Move Window | Moves active window to target workspace |
| `SUPER + M` | Exit | Safely logs out of Hyprland via UWSM |

---

## 🔧 Troubleshooting

- **Black Screen / Wallpaper Not Displaying:**
  - Verify your monitor's refresh rate is explicitly set in `monitors.conf`.
  - Confirm the workshop assets have finished downloading through Steam.
  - Run `pgrep -a linux-wallpaperengine` in a terminal to inspect active engine processes.
- **Build / Compilation Issues:**
  - Ensure the `base-devel`, `cmake`, and required Vulkan/OpenGL graphics drivers (`vulkan-radeon`, `vulkan-intel`, or `nvidia-utils`) are installed.
- **Cracked / Non-Steam Copies:**
  - `linux-wallpaperengine` requires the legitimate Steam workshop file structure and asset format to function correctly.

---

## 🤝 Credits & Upstream

- [Hyprland](https://hyprland.org/) — Dynamic tiling Wayland compositor.
- [linux-wallpaperengine](https://github.com/Almamu/linux-wallpaperengine) by Almamu — Standalone Wallpaper Engine client for Linux.
- [UWSM](https://github.com/Vladimir-csp/uwsm) — Universal Wayland Session Manager.

---

<div align="center">

*Enjoy your rice! Feel free to star the repo if you found this helpful.*

</div># 🪟 LuaHyprlandWithWallpaperEngine

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
