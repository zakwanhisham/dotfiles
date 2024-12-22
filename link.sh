#!/usr/bin/env bash

set -xeu

dotfile="$HOME/dotfiles"

source_folders=(
  "$HOME/.Xresources"
  "$HOME/.bashrc"
  "$HOME/.config/alacritty"
  "$HOME/.config/bat"
  "$HOME/.config/fastfetch"
  "$HOME/.config/fish"
  "$HOME/.config/i3"
  "$HOME/.config/nvim"
  "$HOME/.config/lvim"
  "$HOME/.config/paru"
  "$HOME/.config/starship.toml"
  "$HOME/.config/topgrade.toml"
  "$HOME/.fehbg"
  "$HOME/.gitconfig"
  "$HOME/.local/bin/swap-usage"
  "$HOME/.screenlayout"
  "$HOME/.tmux.conf"
  "$HOME/.vimrc"
  "$HOME/.xsession"
)

errors=false

for folder in "${source_folders[@]}"; do
  file_name=$(basename "$folder")

  src="$dotfile/$file_name"

  if [ -L "$folder" ] || [ -e "$folder" ]; then
    rm -rvf "$folder"
  fi

  ln -s "$src" "$folder"

  if [ $? -ne 0 ]; then
    errors=true
    echo "Error: Failed to create symlink for $folder"
    break
  fi
done

if [ "$errors" = false ]; then
  echo "Symlinks created successfully!"
fi
