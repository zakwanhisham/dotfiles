# If not running interactively, return
if not status is-interactive
    return
end

# Use vi mode
fish_vi_key_bindings

### EXPORT
set fish_greeting

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
    --color=bg:#181616,bg+:#2d4f67,fg:#c5c9c5,fg+:#c8c093
    --color=hl:#8ea4a2,hl+:#7aa89f
    --color=info:#8ba4b0
    --color=border:#c5c9c5
    --color=prompt:#c4b28a,pointer:#e46876
    --color=marker:#938aa9,spinner:#7fb4ca
    --color=header:#a6a69c"

# PATH
set -U fish_user_paths $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $HOME/.local/share/bob/nvim-bin

# ENV VARIABLES
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"

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
abbr rm "rm -iv"
abbr weather "curl wttr.in"

# Config
abbr ala "nvim $HOME/dotfiles/alacritty/alacritty.toml"
abbr bashrc "nvim $HOME/dotfiles/.bashrc"
abbr fishrc "nvim $HOME/dotfiles/fish/config.fish"
abbr ghost "nvim $HOME/dotfiles/ghostty/config"
abbr tconf "nvim $HOME/dotfiles/.tmux.conf"
abbr vimrc "vim $HOME/dotfiles/.vimrc"

### PROMPT AND COMPLETIONS

fzf --fish | source

starship init fish | source
enable_transience
