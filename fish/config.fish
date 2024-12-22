# If not running interactively, return
if not status is-interactive
    return
end

# Use vi mode
fish_vi_key_bindings

### EXPORT
set fish_greeting
set -U HISTCONTROL ignoredups:erasedups
set -U fish_history_max_items 500000
set -U HISTIGNORE "&:[ ]*:exit:ls:ll:bg:fg:history:clear:cd:ssn:ssr:monitor:laptop:ff:con:lg:ng"
set -U IGNOREEOF 100

set -Ux BROWSER "/usr/bin/firefox-developer-edition"
set -Ux MANPAGER "nvim +Man!"
set -Ux SUDO_EDITOR "nvim"
set -Ux VISUAL "nvim"
set -Ux EDITOR "nvim"

# Standard ISO 8601 timestamp
set -U fish_history_format iso8601

# FZF default opts
set -Ux FZF_DEFAULT_OPTS "
    --layout=reverse \
    --border=rounded \
    --cycle \
    --bind 'ctrl-y:accept' \
    --color=fg:#DCD7BA,bg:#181616,hl:#7AA89F \
    --color=fg+:#C8C093,bg+:#2D4F67,hl+:#957FB8 \
    --color=info:#C0A36E,prompt:#C34043,pointer:#D27E99 \
    --color=marker:#76946A,spinner:#957FB8,header:#7AA89F
"

# PATH
set -U fish_user_paths $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $HOME/.local/share/bob/nvim-bin

# ENV VARIABLES
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"

### ALIASES
alias ls "eza --color=always --group-directories-first --icons --git"
alias la "ls -a"
alias ll "ls -la"

### ABBREVIATIONS
abbr autoremove "paru --pacman pacman -Rns (paru --pacman pacman -Qtdq)"
abbr laptop "$HOME/dotfiles/.screenlayout/laptop.sh; and $HOME/.fehbg"
abbr mirror "sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist"
abbr monitor "$HOME/dotfiles/.screenlayout/monitor.sh; and $HOME/.fehbg"
abbr reload "source $HOME/.config/fish/config.fish"
abbr ssn "shutdown now"
abbr ssr "shutdown -r now"
abbr notes "nvim $HOME/dotfiles/NOTES.md"
abbr updatelist "paru --pacman pacman -Syy; and paru --pacman pacman -Qu"
abbr updatepkg "paru --pacman pacman -Qqe > $HOME/dotfiles/pkglist.txt"

# Power profile
abbr perf "powerprofilesctl set performance; and echo 'Set power to Performance'"
abbr bal "powerprofilesctl set balanced; and echo 'Set power to Balanced'"
abbr saver "powerprofilesctl set power-saver; and echo 'Set power to Power-Saver'"

# Apps 
abbr cal "cal --monday -3"
abbr cat "bat"
abbr cp "cp -iv"
abbr feh "feh -B black"
abbr ld "lazydocker"
abbr less "less --use-color -N"
abbr lg "lazygit"
abbr mkdir "mkdir -v"
abbr mv "mv -iv"
abbr open "xdg-open"
abbr rm "rm -iv"
abbr weather "curl wttr.in"
abbr lvim "env NVIM_APPNAME=lvim nvim"

# Config
abbr ala "nvim $HOME/dotfiles/alacritty/alacritty.toml"
abbr bashrc "nvim $HOME/dotfiles/.bashrc"
abbr fishrc "nvim $HOME/dotfiles/fish/config.fish"
abbr tconf "nvim $HOME/dotfiles/.tmux.conf"
abbr vimrc "vim $HOME/dotfiles/.vimrc"

### FUNCTIONS
# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

function ff -d "Find files and cd into it"
    set selected_dir (fd --hidden --type directory . "$HOME" | fzf-tmux -p --header "Directory Selection" -h 40%)
    if test -n "$selected_dir"
        printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
        cd "$selected_dir"
    else
        echo "No directory selected."
    end
end

### PROMPT AND COMPLETIONS

fzf --fish | source

starship init fish | source
enable_transience
