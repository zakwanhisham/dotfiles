return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    dependencies = { "nvim-treesitter/nvim-treesitter-context", opts = { mode = "cursor", max_lines = 5, } },
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            ensure_installed = {
                "c", "diff", "go", "gomod", "gosum", "gowork", "http", "json",
                "json5", "jsonc", "lua", "markdown", "python", "toml", "vim",
                "vimdoc", "yaml",
            },
            ignore_install = {},
            sync_install = true,
            -- Context comment
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            auto_install = true,
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
