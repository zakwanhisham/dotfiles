# If not running interactively, return
if not status is-interactive
    return
end

# keybindings
fish_vi_key_bindings
set fish_cursor_insert block

### EXPORT
set fish_greeting

set -Ux BROWSER "/usr/bin/firefox"
set -Ux SUDO_EDITOR "nvim"
set -Ux VISUAL "nvim"
set -Ux EDITOR "nvim"
set -Ux TERM "tmux-256color"

# FZF default opts
set -Ux FZF_DEFAULT_OPTS "--layout=reverse --border=none --cycle --color=bw"

# PATH
set -U fish_user_paths $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin

# ENV VARIABLES
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_BIN_DIR "$HOME/.local/bin"

### ABBREVIATIONS
abbr autoremove "paru --pacman pacman -Rns (paru --pacman pacman -Qtdq)"
abbr cleanup "paru --pacman pacman -Scc"
abbr reload "source $HOME/.config/fish/config.fish"
abbr ssn "shutdown now"
abbr ssr "shutdown -r now"
abbr todo "nvim $HOME/Documents/NOTES/TODO.md"
abbr updatemirror "sudo reflector -c Malaysia -c Singapore -c Indonesia -c Thailand -c Worldwide --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
abbr updatelist "paru --pacman pacman -Syy && paru --pacman pacman -Qu"

# Apps
abbr cal "cal --monday -3"
abbr cat "bat"
abbr cp "cp -iv"
abbr feh "feh -B black"
abbr less "less --use-color -N --mouse"
abbr lg "lazygit"
abbr mkdir "mkdir -pv"
abbr mv "mv -iv"
abbr rm "rm -iv"
abbr timestamp "date +%d%b%H%M%S"
abbr tree "tree -a -I \"*.git\" -C"
abbr vim "nvim"

# Config
abbr alarc "nvim $HOME/.config/alacritty/alacritty.toml"
abbr bashrc "nvim $HOME/.bashrc"
abbr fishrc "nvim $HOME/.config/fish/config.fish"
abbr tconf "nvim $HOME/.tmux.conf"
abbr vimrc "vim $HOME/.vimrc"

### PROMPT AND COMPLETIONS

fzf --fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

# opencode
fish_add_path /home/ouraaa/.opencode/bin
