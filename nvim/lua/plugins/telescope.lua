local actions = require "telescope.actions"
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
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "Buffer" })
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Oldfiles" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "Git Files" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>fm", require("telescope.builtin").man_pages, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>fs", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "Fuzzy search in current buffer" })
