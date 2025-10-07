local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add { source = "ibhagwan/fzf-lua" }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Fzf: " .. desc end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader><space>", "<cmd>Buffers<cr>", "Buffers")
    nmap("<leader>ff", "<cmd>Files<cr>", "Files")
    nmap("<leader>fg", "<cmd>GFiles<cr>", "Git Files")
    nmap("<leader>fs", "<cmd>Rg<cr>", "Grep")
    nmap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "Word")
    nmap("<leader>fr", "<cmd>FzfLua resume<cr>", "Resume")
    nmap("<leader>/", "<cmd>BLines<cr>", "Buffer Lines")

    require("fzf-lua").setup {
        { "fzf-vim", "hide" },
        winopts = { height = 0.4, width = 1, row = 1, border = "border-top", backdrop = 100 },
        keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
    }
end)
