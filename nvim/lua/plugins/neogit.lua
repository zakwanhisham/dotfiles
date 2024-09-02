return {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = {
        { "<leader>g", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    config = true,
}
