#!/bin/sh
### Created by ilsenatorov
### Change WALLPAPERDIR to the directory where you store wallpapers

WALLPAPERDIR=~/wallpaper/

#selected=$(ls $WALLPAPERDIR | rofi -dmenu -p "Random Wallpaper Folder: ")
selected=$(for a in $(ls $WALLPAPERDIR); do
  echo -en "$a\0icon\x1f$WALLPAPERDIR$a\n"
done | rofi -dmenu)

if [ -n "$selected" ]; then
  ~/.config/hypr/scripts/random-wal-swww.sh $selected
fi
