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
            },
        },
    },
}

-- Call extensions
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "Buffer" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Oldfiles" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git Files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>fs", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(theme.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "Fuzzy search in current buffer" })
