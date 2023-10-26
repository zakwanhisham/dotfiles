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

    -- Git related plugins
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

    -- Vim Surround
    "tpope/vim-surround",

    -- Undotree
    "mbbill/undotree",

    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
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
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require "plugins.cmp"
        end,
    },

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        config = function()
            require "plugins.gitsigns"
        end,
    },

    {
        -- Carbonfox Colorscheme
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "carbonfox"
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
        -- Breadcrumbs
        "Bekaboo/dropbar.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },

    {
        -- Autopairs
        "windwp/nvim-autopairs",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require "plugins.autopairs"
        end,
    },

    {
        -- Todo comment
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        -- Treesitter Context
        "romgrk/nvim-treesitter-context",
        event = "BufReadPre",
        config = function()
            require "plugins.context"
        end,
    },

    {
        -- Nvim Colorizer
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require "plugins.colorizer"
        end,
    },

    {
        -- Formatter and Linter
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            require "plugins.null-ls"
        end,
    },

    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        -- Neotree as File Explorer
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require "plugins.neotree"
        end,
    },

    {
        -- "gc" to comment visual regions/lines
        "numToStr/Comment.nvim",
        config = function()
            require "plugins.comment"
        end,
        opts = {},
    },

    {
        -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        -- tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
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
            { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
            { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        },
        config = function()
            require "plugins.treesitter"
        end,
    },
}, {})
