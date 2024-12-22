function ff -d "Find files and cd into it"
    set selected_dir (fd --hidden --type directory . "$HOME" | fzf-tmux -p --header "Directory Selection" -h 40%)
    if test -n "$selected_dir"
        printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
        cd "$selected_dir"
    else
        echo "No directory selected."
    end
end
