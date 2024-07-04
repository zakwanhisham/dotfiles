#!/usr/bin/env bash

### ALIASES

# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git'
alias la='ls -a'
alias ll='ls -la'

# For convenience
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'
alias reload='source ~/.bashrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias updatelist='paru --pacman pacman -Syy && paru --pacman pacman -Qu'
alias mirror='sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist'

# Changing program name
alias cal='cal --monday -3'
alias cat='bat'
alias cp='cp -iv'
alias less='less --use-color -N'
alias lg='lazygit'
alias mv='mv -iv'
alias open='xdg-open'
alias rm='rm -iv'
alias weather='curl wttr.in'

# Configuration
alias ala='nvim ~/.config/alacritty/alacritty.toml'
alias bashrc='nvim ~/.bashrc'
alias profile='nvim ~/.bash_profile'
alias input='nvim ~/.inputrc'
alias vimrc='vim ~/.vimrc'
