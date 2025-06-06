return {
    "stevearc/oil.nvim",
    lazy = false,
    cmd = "Oil",
    keys = { { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" } },
    opts = {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = { "permissions", "size", "birthtime" },
        view_options = { show_hidden = true, case_insensitive = true },
        keymaps = { ["q"] = "actions.close" },
    },
}
