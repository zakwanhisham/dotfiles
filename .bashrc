# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# VIM mode
if [[ $- == *i* ]]; then
	set -o vi
fi

# SHOPT
shopt -s autocd 2>/dev/null
shopt -s cdspell 2>/dev/null
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand 2>/dev/null
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s globstar 2>/dev/null
shopt -s histappend
shopt -s nocaseglob

### SOURCE AND EVAL

# source bash functions
source $HOME/scripts/bash_functions.sh

# source bash aliases
source $HOME/scripts/bash_alias.sh

# source bash completion
source /usr/share/bash-completion/bash_completion

# source command-not-found
source /usr/share/doc/pkgfile/command-not-found.bash

# source bob completion
eval "$(bob complete bash)"

# fzf completion and keybinds
eval "$(fzf --bash)"

# PROMPT
# PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
