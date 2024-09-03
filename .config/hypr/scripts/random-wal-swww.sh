#!/usr/bin/env bash

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

cachedir=~/.cache/jdiaz

if [ ! -d "$cachedir" ]; then
  mkdir -p "$cachedir"
  echo "Directory created: $cachedir"
fi

cp $wallpaper "$cachedir/wallpaper"

swww img $cachedir/wallpaper \
  --transition-fps=60 \
  --transition-type=any

# -----------------------------------------------------
# Created blurred wallpaper
# -----------------------------------------------------
#
blurred_wallpaper="$cachedir/blurred_wallpaper.png"
square_wallpaper="$cachedir/square_wallpaper.png"

rm "$blurred_wallpaper"
rm "$square_wallpaper"

blur="50x30"

magick $wallpaper -resize 75% $blurred_wallpaper
#echo ":: Resized to 75%"
magick $blurred_wallpaper -blur $blur $blurred_wallpaper
#echo ":: Blurred"

# -----------------------------------------------------
# Created square wallpaper
# ---------------------:--------------------------------

#echo ":: Generate new cached wallpaper square-$wallpaper_filename"
magick $wallpaper -gravity Center -extent 1:1 $square_wallpaper
