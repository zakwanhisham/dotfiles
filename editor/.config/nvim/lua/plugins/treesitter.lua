return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufReadPost" },
    branch = "master",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-context", opts = { mode = "cursor", max_lines = 5, } },
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { enable = false },
            ensure_installed = {
                "c", "diff", "go", "gomod", "gosum", "gowork", "json", "lua",
                "markdown", "python", "vim", "vimdoc", "yaml",
            },
            auto_install = false,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<M-space>",
                },
            },
        }
    end,
}
