# EXPORT
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#f2f4f8,bg:#161616,hl:#78a9ff --color=fg+:#dfdfe0,bg+:#282828,hl+:#33b1ff --color=info:#3ddbd9,prompt:#ee5396,pointer:#be95ff --color=marker:#25be6a,spinner:#be95ff,header:#ff7eb6'

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
export GOPATH=$HOME/go
export CARGO=$HOME/.cargo
export RUSTUP=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu
export BOB=$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$GOPATH/bin:$CARGO/bin:$RUSTUP/bin:$BOB

# ENV VARIABLES
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# SHOPT
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell

# ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

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

### ALIASES
# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git'

# For convenience
alias reload='source ~/.bashrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'
alias updatelist='paru --pacman pacman -Syy && paru --pacman pacman -Qu'
alias asdf='setxkbmap -option caps:swapescape &'

# Changing program name
alias cat='bat'
alias less='less --use-color -N'
alias weather='curl wttr.in'
alias cal='cal --monday -3'
alias diff='nvim -d'

# Configuration
alias i3='nvim ~/.config/i3/config'
alias bashrc='nvim ~/.bashrc'
alias ala='nvim ~/.config/alacritty/alacritty.toml'
alias neo='nvim ~/.config/nvim/init.lua'
alias tconf='nvim ~/.config/tmux/tmux.conf'

# ssh to machine
alias ras-server='sshpass -f ~/.pass/ras-server.txt ssh -o StrictHostKeyChecking=no root@159.223.69.150'
alias robomy-server='sshpass -f ~/.pass/robomy.txt ssh -o StrictHostKeyChecking=no robomy-server@192.168.0.16'

# Quickly change to directory
ff() {
	cd ~ && cd "$(fd --hidden --type d --base-directory ~ | fzf --reverse --height 20%)"
}

# kill process
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
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

# PROMPT
eval "$(starship init bash)"
