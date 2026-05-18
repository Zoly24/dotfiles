#!/bin/bash

# --- 6. THE BIG REVEAL (Wallpaper & Reload) ---
awww img "$1" --transition-type wave --transition-step 180 --transition-fps 240 --transition-wave 50,30

pkill -SIGUSR2 waybar
pkill -SIGUSR1 kitty
pkill -SIGUSR1 nvim
hyprctl reload

# --- 7. NOTIFY ---
notify-send -a "Theme Engine" -i "$1" "Theme Applied" "Applied: Quickshell"
