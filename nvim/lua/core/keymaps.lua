vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<leader>lf", "<CMD>Format<CR>", { desc = "Format files" })

vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

vim.keymap.set("v", "<", "<gv", { desc = "better indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "better indenting" })

vim.keymap.set("x", "<A-j>", "<CMD>m '>+1<CR>gv-gv", { desc = "Move current line up" })
vim.keymap.set("x", "<A-k>", "<CMD>m '<-2<CR>gv-gv", { desc = "Move current line down" })

vim.keymap.set("n", "<leader>bp", "<CMD>bp<CR>", { desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>bn", "<CMD>bn<CR>", { desc = "Buffer Next" })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Buffer Delete" })

vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undotree" })
