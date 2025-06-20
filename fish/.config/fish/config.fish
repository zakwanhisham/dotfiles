# If not running interactively, return
if not status is-interactive
    return
end

# Use default keybindings
fish_default_key_bindings

### EXPORT
set fish_greeting

set -Ux BROWSER "/usr/bin/firefox"
set -Ux MANPAGER "nvim +Man!"
set -Ux SUDO_EDITOR "nvim"
set -Ux VISUAL "nvim"
set -Ux EDITOR "nvim"
set -Ux TERM "tmux-256color"

# FZF default opts
set -Ux FZF_DEFAULT_OPTS "--layout=reverse --border=none --preview-window=border-sharp --cycle"

# PATH
set -U fish_user_paths $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin

# ENV VARIABLES
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"

### ABBREVIATIONS
abbr autoremove "paru --pacman pacman -Rns (paru --pacman pacman -Qtdq)"
abbr laptop "$HOME/.screenlayout/laptop.sh && $HOME/.fehbg"
abbr mirror "sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist"
abbr monitor "$HOME/.screenlayout/monitor.sh && $HOME/.fehbg"
abbr reload "source $HOME/.config/fish/config.fish"
abbr ssn "shutdown now"
abbr ssr "shutdown -r now"
abbr updatelist "paru --pacman pacman -Syy && paru --pacman pacman -Qu"
abbr updatepkg "paru --pacman pacman -Qqe > $HOME/dotfiles/pkglist.txt"

# Eza to ls
abbr la "ls -a"
abbr ll "ls -agl"
abbr lt "ls -aT"

# Apps 
abbr cal "cal --monday -3"
abbr cat "bat"
abbr cp "cp -iv"
abbr feh "feh -B black"
abbr ld "lazydocker"
abbr less "less --use-color -N"
abbr lg "lazygit"
abbr mkdir "mkdir -pv"
abbr mv "mv -iv"
abbr mvim "NVIM_APPNAME=mvim nvim"
abbr pac "paru --pacman pacman"
abbr rm "rm -iv"
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
