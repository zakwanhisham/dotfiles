return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    build = ":TSUpdate",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
        { "nvim-treesitter/nvim-treesitter-context", opts = { mode = "cursor", max_lines = 3 } },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            lazy = true,
            opts = { enable_autocmd = false },
        },
    },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup {
            -- Add languages to be installed here that you want installed for treesitter
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "cpp",
                "diff",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "http",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "jsonc",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "toml",
                "tsx",
                "typescript",
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
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                swap = {
                    -- enable = true,
                    -- swap_next = {
                    --   ["<leader>a"] = "@parameter.inner",
                    -- },
                    -- swap_previous = {
                    --   ["<leader>A"] = "@parameter.inner",
                    -- },
                },
            },
        }
    end,
}
