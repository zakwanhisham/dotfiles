# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/zakwan/.local/bin:$PATH

# GO PATH AND RUST PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export CARGO=$HOME/.cargo/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$CARGO

# replace "cat" with "bat" when using "man" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# man 2 select

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
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='lvim'
else
  export EDITOR='lvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first --icons --git' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons --git'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons --git'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons --git' # tree listing
alias l.='exa -a | rg "^\."'                                              # list all dotfiles & dotfolder

# For convenience
alias reload='source ~/.zshrc && clear'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias asdf='setxkbmap -option caps:swapescape &'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'

# Changing program name
alias v='lvim'
alias z='zellij'
alias cat='bat'
alias weather='curl wttr.in'
alias lg='lazygit'
alias calendar='cal --monday -3'

# Configuration
alias i3='lvim ~/.config/i3/'
alias zshrc='lvim ~/.zshrc'
alias ala='lvim ~/.config/alacritty/alacritty.yml'
alias lunar='lvim ~/.config/lvim/'
alias star='lvim ~/.config/starship.toml'
alias zel='lvim ~/.config/zellij/config.kdl'

# Navigating folder
alias personal='cd ~/Documents/Personal'
alias work='cd ~/Documents/Work'
alias down='cd ~/Downloads'
alias doc='cd ~/Documents'
alias config='cd ~/.config'
alias dotfile='cd ~/.dotfiles'

# pnpm
export PNPM_HOME="/home/zakwan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Starship
eval "$(starship init zsh)"

