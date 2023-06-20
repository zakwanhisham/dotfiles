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

# Variable to track errors
errors=false

# Copy files form each source folder
for folder in "${source_folders[@]}"; do
	cp -r "$folder" "$dotfile"

	# Check if an error occurred during copy
	if [ $? -ne 0 ]; then
		errors=true
		echo "Error: Failed to copy $folder"
	fi
done

# Display success message if no errors occurred
if [ "$errors" = false ]; then
	echo "Files copied successfully!"
fi
