return {
    "stevearc/oil.nvim",
    dependencies = { require("mini.icons").setup {} },
    cmd = { "Oil" },
    keys = {
        { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" },
    },
    opts = {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "birthtime",
        },
        view_options = {
            show_hidden = true,
            case_insensitive = true,
        },
    },
}
