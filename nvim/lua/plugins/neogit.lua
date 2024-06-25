return {
    "NeogitOrg/neogit",
    keys = {
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
}
