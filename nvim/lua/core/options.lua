-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable builtins plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_marchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

-- mouse mode enable
vim.o.mouse = "a"

-- file browser settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- autocomplete list
vim.o.pumheight = 10

-- set cursor
vim.o.guicursor = ""

-- clipboard
vim.o.clipboard = "unnamedplus"

-- line number
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4

-- tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- general editor settings
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.completeopt = "menuone,noselect"
vim.o.ignorecase = true

-- temp files
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.writebackup = false

-- set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- colors
vim.o.termguicolors = true

-- command height
vim.o.cmdheight = 1

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- colorcolumn
vim.o.colorcolumn = "80"

-- code gutter
vim.o.scrolloff = 12
vim.o.sidescrolloff = 12
vim.o.sidescroll = 1

-- split
vim.o.splitbelow = true
vim.o.splitright = true

-- mode
vim.o.showmode = false
vim.o.showcmd = true

-- sign
-- vim.o.fillchars.eob = " "
vim.o.signcolumn = "yes"
vim.o.showtabline = 0
vim.o.cursorline = true

-- don't pass message to |ins-completion-menu|
-- vim.o.shortmess:append("c")
-- vim.o.whichwrap:append("<,>,[,],h,l")
-- vim.o.iskeyword:append("-")
-- vim.o.formatoptions:remove({"c", "r", "o"})

vim.o.conceallevel = 0
vim.o.pumheight = 10
vim.o.laststatus = 3
vim.o.ruler = true
vim.o.linebreak = true

-- hightlight yanked text for 200ms using the "Visual" hightlighting group
vim.cmd([[
    augroup hightlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", time=200})
    augroup END
]])
