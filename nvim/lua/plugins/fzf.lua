return {
    'ibhagwan/fzf-lua',
    cmd = "FzfLua",
    keys = {
        { "<leader><space>", "<cmd>FzfLua buffers<cr>",       desc = "Buffers" },
        { "<leader>ff",      "<cmd>FzfLua files<cr>",         desc = "Find Files" },
        { "<leader>fg",      "<cmd>FzfLua git_files<cr>",     desc = "Git Files" },
        { "<leader>fs",      "<cmd>FzfLua live_grep<cr>",     desc = "Live Grep" },
        { "<leader>fw",      "<cmd>FzfLua grep<cr>",          desc = "Grep String" },
        { "<leader>fo",      "<cmd>FzfLua oldfiles<cr>",      desc = "Oldfies" },
        { "<leader>fr",      "<cmd>FzfLua resume<cr>",        desc = "Resume" },
        { "<leader>fz",      "<cmd>FzfLua spell_suggest<cr>", desc = "Spell suggest" },
        { "<leader>/",       "<cmd>FzfLua grep_curbuf<cr>",   desc = "Grep Current Buffer" },
    },
    config = function()
        require("fzf-lua").setup {
            file_ignore_patterns = { "%.git/.*", "node_modules/.*" },
            winopts = {
                split = "botright new"
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
            actions = {
                files = {
                    true,
                    ["ctrl-y"] = require("fzf-lua.actions").file_edit_or_qf,
                },
            },
            files = {
                prompt = "Files> ",
                cwd_prompt = false,
            },
            oldfiles = {
                cwd_only = function()
                    return vim.api.nvim_command('pwd') ~= vim.env.HOME
                end
            },
        }
    end,
    init = function()
        require("fzf-lua").register_ui_select()
    end
}
