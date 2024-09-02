return {
    "brenoprata10/nvim-highlight-colors",
    keys = {
        { "<leader>h", "<cmd>HighlightColors toggle<cr>", desc = "Highlight Colors" },
    },
    config = function()
        require("nvim-highlight-colors").setup {
            render = "background",
            enable_hex = true,
            enable_short_hex = false,
            enable_rgb = true,
            enable_hsl = true,
            enable_var_usage = true,
            enable_named_colors = true,
            enable_tailwind = true,
            exlude_filetype = {},
            exclude_buftype = {},
        }
    end,
}
