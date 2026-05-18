#!/bin/bash

# --- CONFIGURATION ---
monitor_width=$(hyprctl monitors -j | jq '.[] | select(.focused==true) | .width')
icon_size=$(echo "scale=0; $monitor_width * 0.05" | bc -l | xargs printf "%.0f")
rofi_override="element-icon { size: ${icon_size}px; } element-text { vertical-align: 0.5; }"

WALL_DIR="$HOME/Pictures/Wallpapers"
THEME_DIR="$HOME/.config/sys-themes"
CACHE_DIR="$HOME/.cache/gowall-cache"

KITTY_THEME="$HOME/.config/kitty/colors.conf"
WAYBAR_THEME="$HOME/.config/waybar/colors.css"
ROFI_THEME="$HOME/.config/rofi/colors.rasi"
HYPR_THEME="$HOME/.config/hypr/colors.conf"
NVIM_THEME="$HOME/.config/nvim/current_theme.txt"

mkdir -p "$THEME_DIR"
mkdir -p "$CACHE_DIR"

for img in "$WALL_DIR"/*.{jpg,jpeg,png,webp}; do
    [ -e "$img" ] || continue

    img_name=$(basename "$img")
    thumb="$CACHE_DIR/thumb_$img_name"

    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
        echo "Generating thumbnail for $img_name..."

        magick "$img" -thumbnail 500x500^ -gravity center -extent 500x500 "$thumb"
    fi
done

# --- 2. SELECT WALLPAPER ---
# find: Gets the images
# sort: Puts them in A-Z order
# while read: Formats each line specifically for Rofi
selected_wall=$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do
    echo -en "$A\x00icon\x1f$CACHE_DIR/thumb_$A\n"
done | rofi -dmenu -p "Select Wallpaper" -theme-str "$rofi_override")

[[ -n "$selected_wall" ]] || exit 1

FULL_WALL_PATH="$WALL_DIR/$selected_wall"

echo "You picked: $selected_wall"

# --- 3. SELECT THEME ---
# We go into the theme dir, list only directories, and strip the '/'
# Example: If you have a folder 'onedark', Rofi will show 'onedark'
selected_theme=$(cd "$THEME_DIR" && ls -d */ 2>/dev/null | cut -f1 -d'/' | rofi -dmenu -p "Select Theme Style")

[[ -n "$selected_theme" ]] || exit 1

THEME_PATH="$THEME_DIR/$selected_theme"

# --- 4. PROCESS WALLPAPER (GOWALL) ---
processed_wall="$CACHE_DIR/proc_${selected_theme}_${selected_wall}"

if [ ! -f "$processed_wall" ] || [ "$FULL_WALL_PATH" -nt "$processed_wall" ]; then
    echo "Applying $selected_theme palette to $selected_wall..."
    gowall convert "$FULL_WALL_PATH" -t "$selected_theme" --output "$processed_wall" >/dev/null 2>&1
fi

# --- 5. THE SWITCH (Deep Copy) ---
echo "Applying deep-theme: $selected_theme"

# Kitty
[ -f "$THEME_PATH/kitty/colors.conf" ] && cp "$THEME_PATH/kitty/colors.conf" "$KITTY_THEME"
# Waybar
[ -f "$THEME_PATH/waybar/colors.css" ] && cp "$THEME_PATH/waybar/colors.css" "$WAYBAR_THEME"
# Rofi
[ -f "$THEME_PATH/rofi/colors.rasi" ] && cp "$THEME_PATH/rofi/colors.rasi" "$ROFI_THEME"
# Hyprland
[ -f "$THEME_PATH/hypr/colors.conf" ] && cp "$THEME_PATH/hypr/colors.conf" "$HYPR_THEME"
# Neovim
if [ -f "$THEME_PATH/neovim/name.txt" ]; then
    nvim_name=$(cat "$THEME_PATH/neovim/name.txt")
    echo "$nvim_name" >"$NVIM_THEME"
fi

# --- 6. THE BIG REVEAL (Wallpaper & Reload) ---
awww img "$processed_wall" --transition-type wave --transition-step 180 --transition-fps 240 --transition-wave 100,20

pkill -SIGUSR2 waybar
pkill -SIGUSR1 kitty
pkill -SIGUSR1 nvim
hyprctl reload

# --- 7. NOTIFY ---
notify-send -a "Theme Engine" -i "$processed_wall" "Theme Applied" "Applied: ${selected_theme^}"
