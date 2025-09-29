local add, later = MiniDeps.add, MiniDeps.later

add { source = "tpope/vim-fugitive" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then desc = "Git: " .. desc end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gl", "<cmd>Git log --graph --decorate<cr>", "Log")
    nmap("<leader>gb", "<cmd>Git blame<cr>", "Blame")
    nmap("<leader>gd", "<cmd>Gdiffsplit<cr>", "Diff")
    nmap("<leader>gs", "<cmd>Git status<cr>", "Status")
end)
