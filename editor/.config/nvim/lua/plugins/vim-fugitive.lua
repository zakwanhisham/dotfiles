local add, later = MiniDeps.add, MiniDeps.later

add { source = "tpope/vim-fugitive" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>Git<cr>", "Fugitive")
end)
