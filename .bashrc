# EXPORT
export BROWSER="/usr/bin/firefox-developer-edition"
export EDITOR="nvim"
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=100000
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTSIZE=500000
export IGNOREEOF=100
export MANPAGER="nvim +Man!"
export SUDO_EDITOR="nvim"
export TERM="xterm-256color"
export VISUAL="nvim"

# Standard ISO 8601 timestamp
HISTTIMEFORMAT='%F %T'

# FZF default opts
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#c5c9c5,bg:#181616,hl:#8ba4b0 --color=fg+:#c8c093,bg+:#0d0c0c,hl+:#7fb4ca --color=info:#8ea4a2,prompt:#8a9a7b,pointer:#a292a3 --color=marker:#7aa89f,spinner:#87a987,header:#938aa9'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# VIM mode
if [[ $- == *i* ]]; then
	set -o vi
fi

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/zakwan/.local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# CUSTOM PATH
export BOB=$HOME/.local/share/bob/nvim-bin
export CARGO=$HOME/.cargo
export GOPATH=$HOME/go
export RUSTUP=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu
export PATH=$PATH:$GOPATH/bin:$CARGO/bin:$RUSTUP/bin:$BOB

# ENV VARIABLES
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

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

# ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

# Treat hypens and underscores as equivalent
bind 'set completion-map-case on'

# Display matches for ambiguous patterns at first tab press
bind 'set show-all-if-ambiguous on'

# better command history search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# TAB menu complete
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'TAB:menu-complete'

# Colorize completion
bind 'set colored-stats on'
bind 'set visible-stats on'
bind 'set mark-symlinked-directories on'
bind 'set colored-completion-prefix on'
bind 'set menu-complete-display-prefix on'

# Show vim mode
bind 'set show-mode-in-prompt on'

# Disable control echo
bind 'set echo-control-characters off'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='nvim'
fi

# source fzf keybinding
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# source bash completion
source /usr/share/bash-completion/bash_completion

# source command-not-found
source /usr/share/doc/pkgfile/command-not-found.bash

### ALIASES
# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git'

# For convenience
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'
alias reload='source ~/.bashrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias updatelist='paru --pacman pacman -Syy && paru --pacman pacman -Qu'

# Changing program name
alias cal='cal --monday -3'
alias diff='nvim -d'
alias less='less --use-color -N'
alias lg='lazygit'
alias open='xdg-open'
alias rm='rm -iv'
alias weather='curl wttr.in'

# Configuration
alias ala='nvim ~/.config/alacritty/alacritty.toml'
alias bashrc='nvim ~/.bashrc'
alias i3='nvim ~/.config/i3/config'
alias neo='nvim ~/.config/nvim/init.lua'
alias tconf='nvim ~/.config/tmux/tmux.conf'

# ssh to machine
alias door-pi='sshpass -f ~/.pass/pi.txt ssh -o StrictHostKeyChecking=no pi@192.168.0.6'
alias robomy-server='sshpass -f ~/.pass/robomy.txt ssh -o StrictHostKeyChecking=no robomy-server@192.168.0.16'
alias rasp-robo='sshpass -f ~/.pass/pi5.txt ssh -o StrictHostKeyChecking=no rasp-robo@192.168.0.19'

### BASH FUNCTION
# Quickly change to directory
ff() {
	local selected_dir
	selected_dir=$(fd --hidden --type directory . "$HOME" | fzf \
		--header "Select Directory" \
		--reverse \
		--border=rounded \
		--height 20%)
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

# Tmux
tm() {
	[[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
	if [ $1 ]; then
		tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1")
		return
	fi
	session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&
		tmux $change -t "$session" || echo "No sessions found."
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m --reverse --height 20% | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m --reverse --height 20% | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

# Man
fman() {
	compgen -c | fzf --header "Select Man pages" --height 20% --reverse | xargs man
}

# conda env
con() {
	if [ -n "$1" ]; then
		if [ -n "$2" ]; then
			conda create -n "$1" python="$2"
		else
			conda create -n "$1" python
		fi
		conda activate "$1"
	else
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
					fzf --layout=reverse \
						--info=inline \
						--border=rounded \
						--height=20 \
						--preview-window="right:30%" \
						--preview-label=" conda tree leaves " \
						--preview=$'
						    conda tree -p {3} leaves |
						    perl -F\'[^\\w-_]\' -lae \'print for grep /./, @F;\' |
						    sort
						'
			)
		)
		[[ -n "$choice" ]] && conda activate "$choice"
	fi
}

### SOME EXPORTS
# pnpm
export PNPM_HOME="/home/zakwan/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# nvm end

# conda
__conda_setup="$('/home/zakwan/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/zakwan/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/zakwan/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/zakwan/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup

# PROMPT
# PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
