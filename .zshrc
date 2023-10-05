# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/zakwan/.local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# CUSTOM PATH
export GOPATH=$HOME/go
export CARGO=$HOME/.cargo
export RUSTUP=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu
export LLVM=$HOME/local/llvm16-release
export BOB=$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$GOPATH/bin:$CARGO/bin:$RUSTUP/bin:$LLVM/bin:$BOB

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
ZSH_DISABLE_COMPFIX="true"

# "less" as manpager
export MANPAGER="less"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons --git' # long format
alias la='ls -a'  # all files and dirs
alias ll='ls -al' # my preferred listing
alias lt='ls -aT' # tree listing
alias l.='ls -a | grep "^\.*"' # list all dotfiles & dotfolder

# For convenience
alias reload='source ~/.zshrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias asdf='setxkbmap -option caps:swapescape &'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'

# Changing program name
alias cat='bat'
alias less='less --use-color -N'
alias weather='curl wttr.in'
alias cal='cal --monday -3'

# Configuration
alias i3='nvim ~/.config/i3/config'
alias zshrc='nvim ~/.zshrc'
alias ala='nvim ~/.config/alacritty/alacritty.yml'
alias neo='nvim ~/.config/nvim/init.lua'
alias zel='nvim ~/.config/zellij/config.kdl'

# Quickly change to directory
alias sd='cd ~ && cd $(find * -type d | fzf --reverse --multi --height 50%)'
bindkey -s '^f' 'sd \n'

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
