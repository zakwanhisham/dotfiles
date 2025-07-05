return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>",                  desc = "LazyGit" },
        { "<leader>gf", "<cmd>LazyGitFilter<cr>",            desc = "LazyGit Filter" },
        { "<leader>gc", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit Filter Current File" },
    },
    config = function()
        vim.g.lazygit_floating_window_scaling_factor = 1
    end
}
