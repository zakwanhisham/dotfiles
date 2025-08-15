local add, later = MiniDeps.add, MiniDeps.later

add { source = "tpope/vim-fugitive" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>tab Git<cr>", "Fugitive")
    nmap("<leader>gl", "<cmd>tab Git log --graph %<cr>", "Log")
    nmap("<leader>gb", "<cmd>Git blame<cr>", "Blame")
end)
