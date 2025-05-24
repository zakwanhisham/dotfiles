-- ========================================
-- Options
-- ========================================

vim.opt.mouse = "a"
vim.opt.completeopt = "menu,menuone,noselect"
vim.o.pumheight = 10
vim.o.guicursor = ""
vim.o.number = false
vim.o.relativenumber = false
vim.o.encoding = "utf-8"
vim.o.spelllang = "en_us"
vim.o.breakindent = true
vim.o.laststatus = 1
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.wrap = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.cursorline = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.smartindent = true

-- ========================================
-- Keymaps
-- ========================================

vim.g.mapleader = " "
vim.g.maplocalleader = ";"
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<", "<gv", { desc = "better indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "better indenting" })

-- ========================================
-- Others
-- ========================================

vim.cmd.colorscheme "retrobox"
vim.o.background = "dark"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
