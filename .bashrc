# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

### EXPORT
export BROWSER="/usr/bin/firefox-developer-edition"
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=100000
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTSIZE=500000
export IGNOREEOF=100
export MANPAGER="nvim +Man!"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='nvim'
fi

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/zakwan/.local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# CUSTOM PATH
export BIN=$HOME/.local/bin
export BOB=$HOME/.local/share/bob/nvim-bin
export CARGO=$HOME/.cargo
export GOPATH=$HOME/go
export RUSTUP=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu
export PATH=$PATH:$GOPATH/bin:$CARGO/bin:$RUSTUP/bin:$BOB:$BIN

# ENV VARIABLES
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Node Version Manager(NVM)
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ouraaa/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/ouraaa/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/ouraaa/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/ouraaa/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

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
bind 'set show-all-if-ambiguous on'
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
alias ld='lazydocker'
alias mkdir='mkdir -v'
alias mv='mv -iv'
alias ng='nvim -c Neogit'
alias open='xdg-open'
alias rm='rm -iv'
alias weather='curl wttr.in'
alias vim='nvim'

# Configuration
alias ala='nvim ~/dotfiles/alacritty/alacritty.toml'
alias bashrc='nvim ~/dotfiles/.bashrc'
alias tconf='nvim ~/dotfiles/.tmux.conf'

### BASH FUNCTION
# Quickly change to directory
ff() {
	local selected_dir
	selected_dir=$(fd --hidden --type directory . "$HOME" | fzf-tmux \
		-p \
		--header "Directory Selection" \
		-h 40%)
	if [ -n "$selected_dir" ]; then
		if [ -d "$selected_dir" ]; then
			printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
			cd "$selected_dir" || return 1
		else
			echo "Selected directory does not exist: $selected_dir"
			return 1
		fi
	else
		echo "No directory selected."
	fi
}

# Conda activate environment
con() {
	choice=(
		$(
			conda env list |
				sed 's/\*/ /;1,2d' |
				xargs -I {} bash -c '
                name_path=( {} );
                py_version=( $(${name_path[1]}/bin/python --version) );
                echo ${name_path[0]} ${py_version[1]} ${name_path[1]}
            ' |
				column -t |
				fzf-tmux \
					-p \
					--header "Conda Env" \
					-w 35% \
					-h 40%
		)
	)
	[[ -n "$choice" ]] && conda activate "$choice"
}

### SOURCE AND EVAL
# source bash completion
source /usr/share/bash-completion/bash_completion

# source command-not-found
source /usr/share/doc/pkgfile/command-not-found.bash

# bob completion
eval "$(bob complete bash)"

# fzf completion and keybinds
eval "$(fzf --bash)"

# source go-blueprint completion
eval "$(go-blueprint completion bash)"

# rg completion
eval "$(rg --generate=complete-bash)"

# PROMPT
eval "$(starship init bash)"
