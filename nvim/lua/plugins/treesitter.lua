return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    build = ":TSUpdate",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-context", opts = { mode = "cursor", max_lines = 3 } },
    },
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup {
            -- Add languages to be installed here that you want installed for treesitter
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "diff",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "http",
                "json",
                "json5",
                "jsonc",
                "lua",
                "markdown",
                "python",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
            },
            ignore_install = {},
            sync_install = true,

            -- Context comment
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
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
