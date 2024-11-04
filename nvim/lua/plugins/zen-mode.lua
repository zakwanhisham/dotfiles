return {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
        { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
        window = {
            backdrop = 0.85,
            width = 160,
            height = 1,
            options = {
                number = true,
                relativenumber = true,
                list = false,
            },
        },
    },
}
