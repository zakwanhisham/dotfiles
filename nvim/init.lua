require "options"
require "keymaps"
require "autocommand"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    checker = { enabled = false },
    install = { colorscheme = { "default" } },
    pkg = { enabled = false },
    rocks = { enabled = false },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logiPat",
                "osc52",
                "rplugin",
                "rrhelper",
                "spellfile",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "vimball",
                "zip",
                "zipPlugin",
            },
        },
    },
})
