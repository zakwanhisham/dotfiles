local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local theme = require "telescope.themes"

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        preview = {
            filesize_limit = 0.1, -- MB
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim", -- add this value
        },
    },
    extensions = {
        ["ui-select"] = {
            theme.get_dropdown {
                winblend = 0,
                previewer = false,
            },
        },
    },
}

-- Call extensions
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- Telescope
vim.keymap.set("n", "<leader><space>", function()
    builtin.buffers(theme.get_dropdown {
        winblend = 0,
        previewer = false,
    })
end, { desc = "Buffer" })
vim.keymap.set("n", "<leader>ff", function()
    local is_inside_work_tree = {}
    local opts = theme.get_dropdown {
        winblend = 0,
        previewer = false,
    }

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        vim.fn.system "git rev-parse --is-inside-work-tree"
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if is_inside_work_tree[cwd] then
        builtin.git_files(opts)
    else
        builtin.find_files(opts)
    end
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fs", function()
    builtin.live_grep(theme.get_dropdown {
        winblend = 0,
        previewer = true,
    })
end, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(theme.get_dropdown {
        winblend = 0,
        previewer = false,
    })
end, { desc = "Fuzzy search in current buffer" })
vim.keymap.set("n", "<leader>fh", function()
    builtin.command_history(theme.get_dropdown {
        winblend = 0,
        previewer = false,
    })
end, { desc = "Command history" })
