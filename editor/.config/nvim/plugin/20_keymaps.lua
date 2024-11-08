vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set({"x", "o"}, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set({"x","o"}, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
