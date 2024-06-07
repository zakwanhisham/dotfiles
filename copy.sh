#!/usr/bin/env bash

set -xe

# Destination folder
dotfile="/home/ouraaa/.dotfiles"

# Array of the source folders
source_folders=(
	"/home/ouraaa/.bashrc"
	"/home/ouraaa/.config/alacritty"
	"/home/ouraaa/.config/bat"
	"/home/ouraaa/.config/fastfetch"
	"/home/ouraaa/.config/i3"
	"/home/ouraaa/.config/nvim"
	"/home/ouraaa/.config/starship.toml"
	"/home/ouraaa/.config/topgrade.toml"
	"/home/ouraaa/.fehbg"
	"/home/ouraaa/.gitconfig"
	"/home/ouraaa/.tmux.conf"
	"/home/ouraaa/.Xresources"
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
