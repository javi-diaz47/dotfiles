#!/bin/bash
# This file must be paste into ~/.waypaper_engine/scripts/scrips
# -n to ignore setting the wallpaper
wal -i $1 -n

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar
cp ~/.cache/wal/colors-cava ~/.config/cava/config
