# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

### EXPORT
export HISTCONTROL=ignoredups:erasedups \
	HISTFILESIZE=100000 \
	HISTIGNORE="&:[ ]*:exit:ls:ll:bg:fg:history:clear:cd:ssn:ssr:monitor:laptop:ff:con:lg:ng" \
	HISTSIZE=500000 \
	IGNOREEOF=100

export BROWSER="/usr/bin/firefox-developer-edition" \
	MANPAGER="nvim +Man!" \
	SUDO_EDITOR="nvim" \
	VISUAL="nvim" \
	EDITOR="nvim"

# Standard ISO 8601 timestamp
HISTTIMEFORMAT='%F %T'

# FZF default opts
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
    --layout=reverse \
    --border=rounded \
    --cycle \
    --bind 'ctrl-y:accept' \
    --color=fg:#c5c9c5,bg:#181616,hl:#7fb4ca \
    --color=fg+:#c8c093,bg+:#0d0c0c,hl+:#8ba4b0 \
    --color=info:#c4b28a,prompt:#c4746e,pointer:#938aa9 \
    --color=marker:#8a9a7b,spinner:#a292a3,header:#8ea4a2 \
    "

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$HOME/.local/share/bob/nvim-bin:$PATH

# ENV VARIABLES
export XDG_CACHE_HOME="$HOME/.cache" \
	XDG_CONFIG_HOME="$HOME/.config" \
	XDG_DATA_HOME="$HOME/.local/share"

# Node Version Manager(NVM)
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# SHOPT
shopt -s autocd cdspell checkwinsize cmdhist direxpand dirspell dotglob expand_aliases globstar histappend nocaseglob 2>/dev/null

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

### KEYBINDS

# ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

# Treat hypens and underscores as equivalent
bind 'set completion-map-case on'

# Display matches for ambiguous patterns at first tab press
bind 'set show-all-if-ambiguous on'

# better command history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# TAB menu complete
bind 'set show-all-if-unmodified on'
bind 'TAB: menu-complete'

# Colorize completion
bind 'set colored-stats On'
bind 'set visible-stats On'
bind 'set mark-symlinked-directories On'
bind 'set colored-completion-prefix On'
bind 'set menu-complete-display-prefix On'

# Show vim mode
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string ""'
bind 'set vi-cmd-mode-string ""'

# Disable control echo
bind 'set echo-control-characters off'

### ALIASES
# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git'
alias la='ls -a'
alias ll='ls -la'

# For convenience
alias autoremove='paru --pacman pacman -Rns $(paru --pacman pacman -Qtdq)'
alias laptop="$HOME/dotfiles/.screenlayout/laptop.sh && $HOME/.fehbg"
alias mirror='sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist'
alias monitor="$HOME/dotfiles/.screenlayout/monitor.sh && $HOME/.fehbg"
alias reload="source $HOME/.bashrc"
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias notes="nvim $HOME/dotfiles/NOTES.md"
alias todos="nvim $HOME/dotfiles/TODOS.md"
alias updatelist='paru --pacman pacman -Syy && paru --pacman pacman -Qu'
alias updatepkg="paru --pacman pacman -Qqe > $HOME/dotfiles/pkglist.txt"

# Power profile
alias perf='powerprofilesctl set performance && echo "Set power to Performance"'
alias bal='powerprofilesctl set balanced && echo "Set power to Balanced"'
alias saver='powerprofilesctl set power-saver && echo "Set power to Power-Saver"'

# Changing program name
alias cal='cal --monday -3'
alias cat='bat'
alias cp='cp -iv'
alias feh='feh -B black'
alias ld='lazydocker'
alias less='less --use-color -N'
alias lg='lazygit'
alias mkdir='mkdir -v'
alias mv='mv -iv'
alias ng='nvim -c Neogit'
alias open='xdg-open'
alias rm='rm -iv'
alias weather='curl wttr.in'
alias vim='nvim'

# Configuration
alias ala="nvim $HOME/dotfiles/alacritty/alacritty.toml"
alias bashrc="nvim $HOME/dotfiles/.bashrc"
alias tconf="nvim $HOME/dotfiles/.tmux.conf"
alias vimrc="\vim $HOME/dotfiles/.vimrc"

### BASH FUNCTION
# Quickly change to directory
ff() {
	local selected_dir
	selected_dir=$(fd --hidden --type directory . "$HOME" | fzf-tmux -p --header "Directory Selection" -h 40%)

	if [ -n "$selected_dir" ]; then
		printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
		cd "$selected_dir" || return 1
	else
		echo "No directory selected."
	fi
}

# Conda activate environment
con() {
	local choice
	choice=$(conda env list | sed 's/\*/ /;1,2d' | while read -r name path; do
		if [[ -d "$path" ]]; then
			py_version=$("$path/bin/python" --version 2>/dev/null | awk '{print $2}')
			echo "$name  $py_version  $path"
		fi
	done | column -t | fzf-tmux -p --header "Conda Env" -w 35% -h 40%)

	[[ -n "$choice" ]] && conda activate "$(echo "$choice" | awk '{print $1}')"
}

### SOURCE AND EVAL
# source bash completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

# source command-not-found
[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash

# bob completion
eval "$(bob complete bash)"

# fzf completion and keybinds
eval "$(fzf --bash)"

# rg completion
eval "$(rg --generate=complete-bash)"

# PROMPT
eval "$(starship init bash)"
