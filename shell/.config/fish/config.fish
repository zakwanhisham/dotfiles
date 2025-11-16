# If not running interactively, return
if not status is-interactive
    return
end

# Use default keybindings
fish_default_key_bindings

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
abbr laptop "$HOME/.screenlayout/laptop.sh && $HOME/.fehbg"
abbr monitor "$HOME/.screenlayout/monitor.sh && $HOME/.fehbg"
abbr reload "source $HOME/.config/fish/config.fish"
abbr ssn "shutdown now"
abbr ssr "shutdown -r now"
abbr todo "nvim $HOME/Documents/NOTES/TODO.md"
abbr updatelist "paru --pacman pacman -Syy && paru --pacman pacman -Qu"
abbr updatemirror "sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist"
abbr updatepkg "paru --pacman pacman -Qqe > $HOME/dotfiles/pkglist.txt"

# Apps
abbr cal "cal --monday -3"
abbr cat "bat"
abbr cp "cp -iv"
abbr feh "feh -B black"
abbr less "less --use-color -N --mouse"
abbr ld "lazydocker"
abbr lg "lazygit"
abbr mkdir "mkdir -pv"
abbr mv "mv -iv"
abbr ng "nvim +'Neogit kind=replace'"
abbr rm "rm -iv"
abbr timestamp "date +%d%b%H%M%S"
abbr tree "tree -a -I \"*.git\" -C"
abbr vim "nvim"

# Config
abbr alarc "nvim $HOME/.config/alacritty/alacritty.toml"
abbr bashrc "nvim $HOME/.bashrc"
abbr fishrc "nvim $HOME/.config/fish/config.fish"
abbr ghostrc "nvim $HOME/.config/ghostty/config"
abbr tconf "nvim $HOME/.tmux.conf"
abbr vimrc "vim $HOME/.vimrc"

### PROMPT AND COMPLETIONS

fzf --fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
