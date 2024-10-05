#!/usr/bin/env bash

set -xeu

# Dotfiles folder (source of symlinks)
dotfile="$HOME/dotfiles"

# Array of the target folders where the symlinks should go
source_folders=(
	"$HOME/.Xresources"
	"$HOME/.bashrc"
	"$HOME/.config/alacritty"
	"$HOME/.config/bat"
	"$HOME/.config/fastfetch"
	"$HOME/.config/git"
	"$HOME/.config/i3"
	"$HOME/.config/nvim"
	"$HOME/.config/paru"
	"$HOME/.config/starship.toml"
	"$HOME/.config/topgrade.toml"
	"$HOME/.fehbg"
	"$HOME/.tmux.conf"
	"$HOME/.xsession"
)

# Variable to track errors
errors=false

# Create symlinks from dotfiles to each source location
for folder in "${source_folders[@]}"; do
	# Get the base name of the source folder/file
	file_name=$(basename "$folder")

	# Path to the file in the dotfiles directory
	src="$dotfile/$file_name"

	# Remove the existing file/symlink in the source folder, if it exists
	if [ -L "$folder" ] || [ -e "$folder" ]; then
		rm -rf "$folder"
	fi

	# Create a new symlink from the dotfiles folder to the respective location
	ln -s "$src" "$folder"

	# Check if an error occurred during symlink creation
	if [ $? -ne 0 ]; then
		errors=true
		echo "Error: Failed to create symlink for $folder"
		break
	fi
done

# Display success message if no errors occurred
if [ "$errors" = false ]; then
	echo "Symlinks created successfully!"
fi
