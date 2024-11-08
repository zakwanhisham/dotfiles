function ff -d "Find files and cd into it"
    set selected_dir (fd --hidden -L --type directory . "$HOME" | fzf --header "Directory Selection" --height 40%)
    if test -n "$selected_dir"
        printf "Moving to `%s`\n" "$selected_dir"
        cd "$selected_dir"
    else
        echo "No directory selected."
    end
end
