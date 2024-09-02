return {
    "stevearc/oil.nvim",
    dependencies = { require("mini.icons").setup {} },
    opts = {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        view_options = {
            show_hidden = true,
            case_insensitive = true,
        },
    },
    keys = {
        { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" },
    },
}
