#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.cargo/env"

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
