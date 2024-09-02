return {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" }, desc = "Browse" } },
    cmd = { "Browse" },
    init = function()
        vim.g.netrw_nogx = 1
    end,
    config = true,
}
