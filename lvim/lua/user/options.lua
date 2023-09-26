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
vim.opt.mouse = "a"

-- set cursor
vim.opt.guicursor = ""

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- file browser settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- general editor settings
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.ignorecase = true

-- temp files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.writebackup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- give more space for displaying messages.
vim.opt.cmdheight = 1

-- delays
vim.opt.updatetime = 100

-- don's pass message to |ins-completion-menu|
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- code gutter
vim.opt.colorcolumn = "80"

-- set leader
vim.g.mapleader = " "

-- scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.sidescroll = 1

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- mode
vim.opt.showmode = false
vim.opt.showcmd = true

-- sign
vim.opt.fillchars.eob = " "
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 0
vim.opt.cursorline = true

vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.laststatus = 3
vim.opt.ruler = true
vim.opt.linebreak = true

-- hightlight yanked text for 200ms using the "Visual" hightlight group
vim.cmd([[
    augroup hightlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.hightlight.on_yank({higroup="Visual", time=200})
    augroup END
]])
