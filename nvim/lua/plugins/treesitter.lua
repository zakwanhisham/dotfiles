return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                mode = "cursor",
                max_lines = 5,
            },
            config = function()
                vim.g.skip_ts_context_commentstring_module = true
            end
        },
    },
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup {
            highlight = {
                enable = true,
                ---@diagnostic disable-next-line: unused-local
                disable = function(lang, buf)
                    local max_filesize = 500 * 1024 -- 500 KB
                    ---@diagnostic disable-next-line: undefined-field
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
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
