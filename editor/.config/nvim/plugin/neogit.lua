local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add { source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Git: " .. desc end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>Neogit<cr>", "Neogit")
end)
