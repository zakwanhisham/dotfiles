local add, later = MiniDeps.add, MiniDeps.later

add { source = "kdheepak/lazygit.nvim" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "LazyGit: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>LazyGit<cr>", "Open")
    nmap("<leader>gc", "<cmd>LazyGitFilterCurrentFile<cr>", "Filter Current File")
    nmap("<leader>gf", "<cmd>LazyGitFilter<cr>", "Filter")

    vim.g.lazygit_floating_window_scaling_factor = 1
end)
