-- Useful keymap
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit" })
vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<CMD>noh<CR><esc>", { desc = "Escape and clear hlsearch" })

-- Better Up/Down
vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })

-- File Explorer(Neotree)
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "File Explorer" })

-- Split window vertically
vim.keymap.set("n", "<leader>\\", "<CMD>vsplit<CR>", { desc = "Split Vertical" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to left" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move current line up/down
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move current line down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move current line down" })

-- Format
vim.keymap.set("n", "<leader>lf", "<CMD>Format<CR>", { desc = "Format files" })

-- Code Action
vim.keymap.set("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "better indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "better indenting" })

-- Buffer
vim.keymap.set("n", "<leader>bp", "<CMD>bp<CR>", { desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>bn", "<CMD>bn<CR>", { desc = "Buffer Next" })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Buffer Delete" })

-- Undotree
vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undotree" })

-- Comment
vim.keymap.set(
    "n",
    "<leader>/",
    "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>",
    { desc = "Toggle Comment" }
)
vim.keymap.set(
    "v",
    "<leader>/",
    "<esc><CMD>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
    { desc = "Toggle Comment" }
)
