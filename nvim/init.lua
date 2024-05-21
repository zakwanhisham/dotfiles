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

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { "default" },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "editorconfig",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logiPat",
                "man",
                "osc52",
                "rplugin",
                "rrhelper",
                "spellfile",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "tutor",
                "vimball",
                "zip",
                "zipPlugin",
            },
        },
    },
})
