MiniDeps.add {
    source = "ibhagwan/fzf-lua"
}

local nmap = function(keymap, command, desc)
    if desc then
        desc = "FZF: " .. desc
    end

    vim.keymap.set("n", keymap, command, { desc = desc })
end


nmap("<leader><space>", "<cmd>FzfLua buffers<cr>", "Buffers")
nmap("<leader>ff", "<cmd>FzfLua files<cr>", "Find Files")
nmap("<leader>fg", "<cmd>FzfLua git_files<cr>", "Git Files")
nmap("<leader>fs", "<cmd>FzfLua live_grep<cr>", "Live Grep")
nmap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "Grep Word")
nmap("<leader>fm", "<cmd>FzfLua marks<cr>", "Marks")
nmap("<leader>fo", "<cmd>FzfLua oldfiles<cr>", "Oldfies")
nmap("<leader>fr", "<cmd>FzfLua resume<cr>", "Resume")
nmap("<leader>fz", "<cmd>FzfLua spell_suggest<cr>", "Spell suggest")
nmap("<leader>/", "<cmd>FzfLua grep_curbuf<cr>", "Grep Current Buffer")

MiniDeps.later(function()
    require("fzf-lua").setup {
        file_ignore_patterns = { "%.git/.*", "node_modules/.*" },
        winopts = {
            split = "belowright new"
        },
        keymap = {
            builtin = {
                true,
                ["<c-f>"] = "preview-page-down",
                ["<c-b>"] = "preview-page-up",
            },
            fzf = {
                true,
                ["ctrl-q"] = "select-all+accept",
                ["ctrl-u"] = "half-page-up",
                ["ctrl-d"] = "half-page-down",
                ["ctrl-x"] = "jump",
                ["ctrl-f"] = "preview-page-down",
                ["ctrl-b"] = "preview-page-up",
            },
        },
        files = {
            prompt = "Files❯ ",
            cwd_prompt = false,
        },
        oldfiles = {
            prompt = "History❯ ",
            cwd_only = function()
                return vim.api.nvim_command('pwd') ~= vim.env.HOME
            end
        },
        buffers = { prompt = "Buffers❯ " },
        grep = { prompt = "Rg❯ " },
    }
end)
