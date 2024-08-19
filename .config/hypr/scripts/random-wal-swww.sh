#!/bin/bash
# This file must be paste into ~/.waypaper_engine/scripts/scrips
# -n to ignore setting the wallpaper
wal -q -i ~/wallpaper/

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar
cp ~/.cache/wal/colors-cava ~/.config/cava/config
cp ~/.cache/wal/colors-rofi-pywal.rasi ~/.config/rofi/themes/colors.rasi

wallpaper=$(cat "$HOME/.cache/wal/wal")

swww img $wallpaper \
  --transition-fps=60 \
  --transition-type=any
