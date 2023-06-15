#!/bin/bash

# Destination folder
dotfile="/home/zakwan/.dotfiles"

# Array of the source folders
source_folders=(
	"/home/zakwan/.zshrc"
	"/home/zakwan/.config/lvim"
	"/home/zakwan/.config/alacritty"
	"/home/zakwan/.config/starship.toml"
	"/home/zakwan/.config/i3"
	"/home/zakwan/.config/zellij"
)

# Copy files form each source folder
for folder in "${source_folders[@]}"; do
	cp -r "$folder" "$dotfile"
done

# Print the end of program
echo "Files copied successfully!"
