#!/bin/bash

exec polkit-gnome &

feh --bg-fill ~/wallpaper/bocchi-the-rock-kesoku-band.jpg

# Start picom
picom --config ~/.config/picom/picom.conf &
