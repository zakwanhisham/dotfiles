# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/zakwan/.local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# CUSTOM PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export CARGO=$HOME/.cargo
export RUSTUP=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu
export LLVM=$HOME/local/llvm16-release
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$CARGO/bin:$RUSTUP/bin:$LLVM/bin

ZSH_DISABLE_COMPFIX="true"

## "less" as manpager
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
alias ls='exa -l --color=always --group-directories-first --icons --git'  # long format
alias la='exa -a --color=always --group-directories-first --icons --git'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first --icons --git' # my preferred listing
alias lt='exa -aT --color=always --group-directories-first --icons --git' # tree listing
alias l.='exa -a | rg "^\."'                                              # list all dotfiles & dotfolder

# For convenience
alias reload='source ~/.zshrc'
alias ssn='shutdown now'
alias ssr='shutdown -r now'
alias asdf='setxkbmap -option caps:swapescape &'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias laptop='~/.screenlayout/laptop.sh'
alias monitor='~/.screenlayout/monitor.sh'

# Changing program name
alias vim='lvim'
alias cat='bat'
alias less='less --use-color -N'
alias grep='grep -rni --color=always'
alias weather='curl wttr.in'
alias calendar='cal --monday -3'

# Configuration
alias i3='lvim ~/.config/i3/config'
alias zshrc='lvim ~/.zshrc'
alias ala='lvim ~/.config/alacritty/alacritty.yml'
alias lunar='lvim ~/.config/lvim/config.lua'
alias neovim='nvim ~/.config/nvim/init.lua'
alias zel='lvim ~/.config/zellij/config.kdl'

# Set fzf and open in lvim
alias fzf='fzf --preview="bat --style numbers,changes --color=always {} | head -500"'
bindkey -s '^f' 'lvim $(fzf)\n'

# pnpm
export PNPM_HOME="/home/zakwan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/zakwan/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/zakwan/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/zakwan/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/zakwan/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

# Starship
eval "$(starship init zsh)"
