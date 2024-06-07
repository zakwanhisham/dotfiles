#!/usr/bin/env bash

random_wallpaper="$(fd -e png -e jpg . /home/ouraaa/Pictures/anime/ --max-depth 1 | shuf | head -n 1)"
target_size=$(xrandr | grep '*' | awk '{print $1}')
temp_image=$(mktemp --suffix=.png)

magick "$random_wallpaper" -background black -gravity center -extent "$target_size" "$temp_image"

i3lock -t -i "$temp_image"

rm "$temp_image"
