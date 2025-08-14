local add, now = MiniDeps.add, MiniDeps.now

add { source = "tpope/vim-fugitive" }

now (function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>Git<cr>", "Fugitive")
    nmap("<leader>gb", "<cmd>Git blame<cr>", "Blame")
end)
