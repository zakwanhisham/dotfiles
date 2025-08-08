MiniDeps.add { source = "stevearc/oil.nvim" }

vim.keymap.set("n", "<leader>-", "<cmd>Oil<cr>", { desc = "Oil" })

require("oil").setup {
    default_file_explorer = true,
    watch_for_changes = true,
    columns = { "permissions", "size", "birthtime" },
    keymaps = { ["q"] = "actions.close" },
    view_options = { show_hidden = true, case_insensitive = true },
}
