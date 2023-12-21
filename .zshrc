# If you come from bash you might have to change your $PATH.
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

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
ZSH_DISABLE_COMPFIX="true"

# Customize fzf theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#f2f4f8,bg:#161616,hl:#78a9ff --color=fg+:#dfdfe0,bg+:#282828,hl+:#33b1ff --color=info:#3ddbd9,prompt:#ee5396,pointer:#be95ff --color=marker:#25be6a,spinner:#be95ff,header:#ff7eb6'

# "nvim +Man!" as manpager
export MANPAGER="nvim +Man!"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Keep this empty to use the starship theme
ZSH_THEME=""

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# source fzf keybinding
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git' 

# For convenience
alias reload='source ~/.zshrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'
alias asdf='setxkbmap -option caps:swapescape &'

# Changing program name
alias cat='bat'
alias less='less --use-color -N'
alias weather='curl wttr.in'
alias cal='cal --monday -3'
alias news='hackernews_tui'
alias diff='nvim -d'
alias vim='nvim'

# Configuration
alias i3='nvim ~/.config/i3/config'
alias zshrc='nvim ~/.zshrc'
alias ala='nvim ~/.config/alacritty/alacritty.yml'
alias neo='nvim ~/.config/nvim/init.lua'
alias tconf='nvim ~/.config/tmux/tmux.conf'

# ssh to machine
alias ubuntu-server='ssh robo@192.168.0.11'
alias ubuntu-desktop='ssh robo@192.168.0.16'
alias ras-server='ssh root@159.223.69.150'

# Quickly change to directory
alias search='cd && cd $(fd --hidden --type d --base-directory ~ | fzf --reverse --height 20%)'
bindkey -s '^d' 'search \n'

# pnpm
export PNPM_HOME="/home/zakwan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

# Starship
eval "$(starship init zsh)"
