--[[ Globals ]]
-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- TS context comment string
vim.g.skip_ts_context_commentstring_module = true

-- Netrw customization
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_sort_by = "name"
vim.g.netrw_preview = 1

-- Markdown
vim.g.markdown_recommended_style = 0

-- [[ Options ]]
-- mouse mode enable
vim.o.mouse = "a"

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

-- case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.breakindent = true

-- general editor settings
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.completeopt = "menuone,noselect,preview,noinsert"
vim.o.ignorecase = true

-- spell check
vim.o.spelllang = "en_us"
vim.o.spell = true

-- temp files
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
vim.o.undofile = true
vim.o.writebackup = false

-- set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- colors
vim.o.termguicolors = true
vim.o.background = "dark"

-- command height
vim.o.cmdheight = 1

-- command line
vim.o.wildmode = "longest:full,full"
vim.o.inccommand = "split"

-- decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 400

-- colorcolumn
vim.o.colorcolumn = "80"
vim.o.cursorline = true

-- code gutter
vim.o.scrolloff = 12
vim.o.sidescrolloff = 12
vim.o.sidescroll = 0
vim.o.smoothscroll = true

-- split
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"

-- mode
vim.o.showmode = false
vim.o.showcmd = true

-- sign
vim.o.signcolumn = "yes"
vim.o.showtabline = 1

-- list
vim.opt.list = true
vim.opt.listchars = { eol = "↲", nbsp = "␣", tab = "» ", trail = "·" }
vim.opt.fillchars = { eob = "~" }

-- misc
vim.o.conceallevel = 0
vim.o.laststatus = 2
vim.o.ruler = true
vim.o.linebreak = true
