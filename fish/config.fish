# If not running interactively, return
if not status is-interactive
    return
end

# Use vi mode
# fish_vi_key_bindings
fish_default_key_bindings

### EXPORT
set fish_greeting

set -Ux BROWSER "/usr/bin/firefox-developer-edition"
set -Ux MANPAGER "nvim +Man!"
set -Ux SUDO_EDITOR "nvim"
set -Ux VISUAL "nvim"
set -Ux EDITOR "nvim"

# FZF default opts
set -Ux FZF_DEFAULT_OPTS "--layout=reverse --border=sharp --preview-window=border-sharp --cycle"

# PATH
set -U fish_user_paths $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $HOME/.local/share/bob/nvim-bin

# ENV VARIABLES
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"

### ABBREVIATIONS
abbr autoremove "paru --pacman pacman -Rns (paru --pacman pacman -Qtdq)"
abbr laptop "$HOME/dotfiles/.screenlayout/laptop.sh && $HOME/.fehbg"
abbr mirror "sudo reflector --verbose -c ID -c SG -c TH --protocol https --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist"
abbr monitor "$HOME/dotfiles/.screenlayout/monitor.sh && $HOME/.fehbg"
abbr reload "source $HOME/.config/fish/config.fish"
abbr ssn "shutdown now"
abbr ssr "shutdown -r now"
abbr notes "nvim $HOME/dotfiles/NOTES.md"
abbr updatelist "paru --pacman pacman -Syy && paru --pacman pacman -Qu"
abbr updatepkg "paru --pacman pacman -Qqe > $HOME/dotfiles/pkglist.txt"

# Eza to ls
abbr la "ls -a"
abbr ll "ls -la"
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
abbr rm "rm -iv"
abbr weather "curl wttr.in"

# Config
abbr ala "nvim $HOME/dotfiles/alacritty/alacritty.toml"
abbr bashrc "nvim $HOME/dotfiles/.bashrc"
abbr fishrc "nvim $HOME/dotfiles/fish/config.fish"
abbr ghost "nvim $HOME/dotfiles/ghostty/config"
abbr taskrc "nvim $HOME/dotfiles/.taskrc"
abbr tconf "nvim $HOME/dotfiles/.tmux.conf"
abbr vimrc "vim $HOME/dotfiles/.vimrc"

### PROMPT AND COMPLETIONS

fzf --fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
