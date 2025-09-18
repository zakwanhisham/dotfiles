local add, later = MiniDeps.add, MiniDeps.later

add { source = "ibhagwan/fzf-lua" }

later(function()
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
        "fzf-vim",
        winopts = { split = "botright new" },
        keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
    }
end)
