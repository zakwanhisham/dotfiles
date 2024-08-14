#!/usr/bin/env bash

set -xeu

# Destination folder
dotfile="$HOME/dotfiles"

# Array of the source folders
source_folders=(
	"$HOME/.Xresources"
	"$HOME/.bashrc"
	"$HOME/.condarc"
	"$HOME/.config/alacritty"
	"$HOME/.config/bat"
	"$HOME/.config/fastfetch"
	"$HOME/.config/git"
	"$HOME/.config/i3"
	"$HOME/.config/nvim"
	"$HOME/.config/starship.toml"
	"$HOME/.config/topgrade.toml"
	"$HOME/.fehbg"
	"$HOME/.tmux.conf"
	"$HOME/.xsession"
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
	paru --pacman pacman -Qqe >$HOME/dotfiles/pkglist.txt
fi
