--[[ Useful keymap ]]
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

--[[ Macro ]]
vim.keymap.set("n", "Q", "@qj")
vim.keymap.set("x", "Q", ":norm @q<cr>")

--[[ Better Up/Down ]]
vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--[[ Resize window using <ctrl> arrow keys ]]
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--[[ Better indenting ]]
-- Don't know if this is needed because already has mini.move
-- vim.keymap.set("v", "<", "<gv", { desc = "better indenting" })
-- vim.keymap.set("v", ">", ">gv", { desc = "better indenting" })

--[[ Quickfix list movement ]]
vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>", { desc = "Quickfix prev" })

-- [[ https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n ]]
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

--[[ Buffer ]]
vim.keymap.set("n", "<leader>bc", "<cmd>vnew<cr>", { desc = "Buffer New" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Buffer Next" })
vim.keymap.set("n", "<leader>bd", function()
    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 1 then
            vim.cmd.write()
            vim.api.nvim_buf_delete(0, { force = false })
        elseif choice == 2 then
            vim.api.nvim_buf_delete(0, { force = true })
        end
    else
        vim.api.nvim_buf_delete(0, { force = true })
    end
end, { desc = "Buffer Delete" })

-- [[ Tab ]]
vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<cr>", { desc = "Tab New" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Tab Previous" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabNext<cr>", { desc = "Tab Next" })
vim.keymap.set("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Tab Close" })

--[[ Diagnostic keymaps ]]
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
vim.keymap.set("n", "<leader>d", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Diagnostic list" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump { count = -1 }
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump { count = 1 }
end, { desc = "Go to next diagnostic message" })
