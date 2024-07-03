# EXPORT
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
export FZF_DEFAULT_OPTS=' --color=fg:#c8c093,bg:#181616,hl:#8ba4b0 --color=fg+:#c5c9c5,bg+:#0d0c0c,hl+:#7fb4ca --color=info:#8ea4a2,prompt:#8a9a7b,pointer:#a292a3 --color=marker:#7aa89f,spinner:#87a987,header:#938aa9'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# VIM mode
if [[ $- == *i* ]]; then
	set -o vi
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
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
alias vimrc='vim ~/.vimrc'

### BASH FUNCTION

# Quickly change to directory
ff() {
	local selected_dir
	selected_dir=$(fd --hidden --type directory . "$HOME" | fzf-tmux \
		-p \
		--header "Select Directory" \
		--layout=reverse \
		--border=sharp \
		--cycle \
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

# conda env
con() {
	if [ -n "$1" ]; then
		if [ -n "$2" ]; then
			conda create -n "$1" python="$2"
		else
			conda create -n "$1" python
		fi
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
					fzf-tmux \
						-p \
						--header "Conda Environment" \
						--layout=reverse \
						--cycle \
						--border=sharp \
						-w 35% \
						-h 40%
			)
		)
		[[ -n "$choice" ]] && conda activate "$choice"
	fi
}

# Extract for common file format
SAVEIFS=$IFS
IFS="$(printf '\n\t')"

function extract {
	if [ $# -eq 0 ]; then
		# display usage if no parameters given
		echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
		echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
	fi
	for n in "$@"; do
		if [ ! -f "$n" ]; then
			echo "'$n' - file doesn't exist"
			return 1
		fi

		case "${n%,}" in
		*.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
			tar zxvf "$n"
			;;
		*.lzma) unlzma ./"$n" ;;
		*.bz2) bunzip2 ./"$n" ;;
		*.cbr | *.rar) unrar x -ad ./"$n" ;;
		*.gz) gunzip ./"$n" ;;
		*.cbz | *.epub | *.zip) unzip ./"$n" ;;
		*.z) uncompress ./"$n" ;;
		*.7z | *.apk | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar | *.vhd)
			7z x ./"$n"
			;;
		*.xz) unxz ./"$n" ;;
		*.exe) cabextract ./"$n" ;;
		*.cpio) cpio -id <./"$n" ;;
		*.cba | *.ace) unace x ./"$n" ;;
		*.zpaq) zpaq x ./"$n" ;;
		*.arc) arc e ./"$n" ;;
		*.cso) ciso 0 ./"$n" ./"$n.iso" &&
			extract "$n.iso" && \rm -f "$n" ;;
		*.zlib) zlib-flate -uncompress <./"$n" >./"$n.tmp" &&
			mv ./"$n.tmp" ./"${n%.*zlib}" && rm -f "$n" ;;
		*.dmg)
			hdiutil mount ./"$n" -mountpoint "./$n.mounted"
			;;
		*.tar.zst) tar -I zstd -xvf ./"$n" ;;
		*.zst) zstd -d ./"$n" ;;
		*)
			echo "extract: '$n' - unknown archive method"
			return 1
			;;
		esac
	done
}

IFS=$SAVEIFS

# Gitignore
gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}

### SOME EXPORTS

# source bash completion
source /usr/share/bash-completion/bash_completion

# source command-not-found
source /usr/share/doc/pkgfile/command-not-found.bash

# source bob completion
eval "$(bob complete bash)"

# fzf completion and keybinds
eval "$(fzf --bash)"

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

# PROMPT
# PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
