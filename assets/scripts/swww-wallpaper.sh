#!/usr/bin/env sh
set -eu

WALLPAPER_DIR="$HOME/wallpapers"

choice="$(ls -1 "$WALLPAPER_DIR" | fuzzel --dmenu --prompt 'Wallpaper: ')"

[ -z "$choice" ] && exit 0

swww img "$WALLPAPER_DIR/$choice" \
  --transition-type grow \
  --transition-duration 0.6

