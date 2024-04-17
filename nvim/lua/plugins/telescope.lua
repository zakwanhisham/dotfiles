local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local theme = require "telescope.themes"

require("telescope").setup {
    defaults = {
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
    builtin.find_files(theme.get_dropdown {
        winblend = 0,
        previewer = false,
    })
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fw", function()
    builtin.live_grep(theme.get_dropdown {
        winblend = 0,
        previewer = true,
    })
end, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fs", function()
    builtin.current_buffer_fuzzy_find(theme.get_dropdown {
        winblend = 0,
        previewer = false,
    })
end, { desc = "Fuzzy search in current buffer" })
