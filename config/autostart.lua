-- Load random wallpaper variable from /home/kannan/.config/hypr/config/wallpaper.lua
local wallpaper_id = dofile("/home/kannan/.config/hypr/config/wallpaper.lua")

-- Auto-start config
hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")
    hl.exec_cmd("linux-wallpaperengine --screen-root HDMI-A-1 --silent " .. wallpaper_id)
end)