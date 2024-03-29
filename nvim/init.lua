require "core.options"
require "core.keymaps"
require "core.autocommand"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            require "plugins.lsp"
        end,
    },
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets",
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.executable "make" == 1 then
                        return "make install_jsregexp"
                    else
                        return "echo 'make not found'"
                    end
                end)(),
            },
            {
                "Exafunction/codeium.nvim",
                cmd = "Codeium",
                build = ":Codeium Auth",
                opts = {},
            },
        },
        config = function()
            require "plugins.cmp"
        end,
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.gitsigns"
        end,
    },
    {
        -- Kanagawa Colorscheme
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "kanagawa-dragon"
        end,
    },
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        config = function()
            require "plugins.lualine"
        end,
    },
    {
        -- Autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require "plugins.autopairs"
        end,
    },
    {
        -- Vim Surround
        "echasnovski/mini.surround",
        event = "BufEnter",
        version = false,
        config = function()
            require("mini.surround").setup()
        end,
    },
    {
        -- Indentscope
        "echasnovski/mini.indentscope",
        event = "BufEnter",
        version = false,
        config = function()
            require("mini.indentscope").setup()
        end,
    },
    {
        -- Formatter and Linter
        "nvimtools/none-ls.nvim",
        event = "LspAttach",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            require "plugins.null-ls"
        end,
    },
    {
        -- Trouble
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        opts = {},
    },
    {
        -- Neogit
        "NeogitOrg/neogit",
        event = "BufEnter",
        branch = "nightly",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
        },
        config = function()
            require "plugins.neogit"
        end,
    },
    {
        -- "gc" to comment visual regions/lines
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.comment"
        end,
        opts = {},
    },
    {
        -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        event = "BufEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
        },
        config = function()
            require "plugins.telescope"
        end,
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            { "nvim-treesitter/nvim-treesitter-context", opts = {} },
            { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
            { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        },
        config = function()
            require "plugins.treesitter"
        end,
    },
}, {
    install = {
        colorscheme = { "kanagawa-dragon" },
    },
})
