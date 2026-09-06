-- Load random wallpaper variable from /home/kannan/.config/hypr/config/wallpaper.lua
local wallpaper_id = dofile("/home/kannan/.config/hypr/config/wallpaper.lua")

-- Auto-start config
hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    --hl.exec_cmd("fcitx5 -d") #use this for japanese keyboard
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")
    hl.exec_cmd("linux-wallpaperengine --screen-root HDMI-A-1 --silent " .. wallpaper_id)--very important for wallpaper engine to work on ur pc from boot up can the aruguments according to your need this is an example for my pc
end) 
