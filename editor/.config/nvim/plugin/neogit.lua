local add, later = MiniDeps.add, MiniDeps.later

add { source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then desc = "Git: " .. desc end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>Neogit<cr>", "Neogit")

    require("neogit").setup { disable_hint = true }
end)
