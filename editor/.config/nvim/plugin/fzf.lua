local add, later = MiniDeps.add, MiniDeps.later

add { source = "ibhagwan/fzf-lua" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "FZF: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader><space>", "<cmd>FzfLua buffers<cr>", "Buffers")
    nmap("<leader>ff", "<cmd>FzfLua files<cr>", "Files")
    nmap("<leader>fs", "<cmd>FzfLua grep<cr>", "Grep")
    nmap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "Word")
    nmap("<leader>fm", "<cmd>FzfLua marks<cr>", "Marks")
    nmap("<leader>fr", "<cmd>FzfLua resume<cr>", "Resume")
    nmap("<leader>/", "<cmd>FzfLua grep_curbuf<cr>", "Search Buffer")

    require("fzf-lua").setup {
        defaults = { file_icons = false },
        file_ignore_patterns = { "%.git/.*", "node_modules/.*" },
        winopts = { split = "botright new" },
        files = { cwd_prompt = false },
        grep = { cmd = "rg --vimgrep --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e" },
    }
end)
