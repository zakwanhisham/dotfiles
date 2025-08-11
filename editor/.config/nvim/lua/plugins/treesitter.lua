local add, later = MiniDeps.add, MiniDeps.later

add {
    source = "nvim-treesitter/nvim-treesitter",
    depends = { "nvim-treesitter/nvim-treesitter-context" },
    checkout = "master",
    monitor = "main",
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
}

later(function()
    require("nvim-treesitter.install").prefer_git = true

    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = false },
        ensure_installed = {
            "c", "diff", "go", "gomod", "gosum", "gowork", "json", "lua",
            "markdown", "python", "vim", "vimdoc", "yaml",
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

    require("treesitter-context").setup { max_lines = 5 }
end)
