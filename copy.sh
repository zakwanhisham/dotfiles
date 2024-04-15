#!/usr/bin/env bash

set -xe

# Destination folder
dotfile="/home/zakwan/.dotfiles"

# Array of the source folders
source_folders=(
	"/home/zakwan/.bashrc"
	"/home/zakwan/.config/alacritty"
	"/home/zakwan/.config/bat"
	"/home/zakwan/.config/dunst"
	"/home/zakwan/.config/example.picom.conf"
	"/home/zakwan/.config/i3"
	"/home/zakwan/.config/nvim"
	"/home/zakwan/.config/starship.toml"
	"/home/zakwan/.config/tmux/tmux.conf"
	"/home/zakwan/.config/topgrade.toml"
	"/home/zakwan/.fehbg"
	"/home/zakwan/.gitconfig"
)

# Variable to track errors
errors=false

# Copy files form each source folder
for folder in "${source_folders[@]}"; do
	cp -r "$folder" "$dotfile"

	# Check if an error occurred during copy
	if [ $? -ne 0 ]; then
		errors=true
		echo "Error: Failed to copy $folder"
		break
	fi
done

# Display success message if no errors occurred
if [ "$errors" = false ]; then
	echo "Files copied successfully!"
	paru --pacman pacman -Qqe >~/.dotfiles/pkglist.txt
fi
