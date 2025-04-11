# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### EXPORT
export HISTCONTROL=ignoredups:erasedups \
    HISTFILESIZE=100000 \
    HISTIGNORE="&:[ ]*:exit:ls:ll:bg:fg:history:clear:cd:ssn" \
    HISTSIZE=500000 \
    IGNOREEOF=100

export BROWSER="/usr/bin/firefox" \
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
    "

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$HOME/.local/share/bob/nvim-bin:$PATH

# ENV VARIABLES
export XDG_CACHE_HOME="$HOME/.cache" \
    XDG_CONFIG_HOME="$HOME/.config" \
    XDG_DATA_HOME="$HOME/.local/share"

# SHOPT
shopt -s autocd cdspell checkwinsize cmdhist direxpand dirspell dotglob expand_aliases globstar histappend nocaseglob 2>/dev/null

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

# Disable control echo
bind 'set echo-control-characters off'

### ALIASES
# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --git'
alias la='ls -a'
alias ll='ls -la'

# Changing program name
alias cat='bat'
alias cp='cp -iv'
alias less='less --use-color -N'
alias mkdir='mkdir -v'
alias mv='mv -iv'
alias open='xdg-open'
alias rm='rm -iv'

### BASH FUNCTION
# Quickly change to directory
ff() {
    local selected_dir
    selected_dir=$(fd --hidden --type directory . "$HOME" | fzf --header "Directory Selection" --height 40%)

    if [ -n "$selected_dir" ]; then
        printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
        cd "$selected_dir" || return 1
    else
        echo "No directory selected."
    fi
}
### SOURCE AND EVAL
# source bash completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

# source command-not-found
[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash

# fzf completion and keybinds
eval "$(fzf --bash)"

# rg completion
eval "$(rg --generate=complete-bash)"
