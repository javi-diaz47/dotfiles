#!/bin/bash

# Set a cron job to rerun this script each 15 min
#*/15 * * * * hyprctl --instance 0 dispatch exec /home/jdiaz/.config/hypr/scripts/random-wal-swww.sh

# This file must be paste into ~/.waypaper_engine/scripts/scrips
# -n to ignore setting the wallpaper
#
if [ -z "$1" ]; then
  wal -q -i ~/wallpaper/
else
  wal -q -i ~/wallpaper/$1
fi

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar
cp ~/.cache/wal/colors-cava ~/.config/cava/config
cp ~/.cache/wal/colors-rofi-pywal.rasi ~/.config/rofi/themes/colors.rasi

wallpaper=$(cat ~/.cache/wal/wal)

cp $wallpaper ~/.cache/wallpaper

swww img ~/.cache/wallpaper \
  --transition-fps=60 \
  --transition-type=any

# -----------------------------------------------------
# Created blurred wallpaper
# -----------------------------------------------------
#
blurred_wallpaper="$HOME/.cache/blurred_wallpaper.png"
square_wallpaper="$HOME/.cache/square_wallpaper.png"
blur="50x30"

magick $wallpaper -resize 75% $blurred_wallpaper
#echo ":: Resized to 75%"
magick $blurred_wallpaper -blur $blur $blurred_wallpaper
#echo ":: Blurred"

# -----------------------------------------------------
# Created square wallpaper
# -----------------------------------------------------

#echo ":: Generate new cached wallpaper square-$wallpaper_filename"
magick $wallpaper -gravity Center -extent 1:1 $square_wallpaper
