--[[ Useful keymap ]]
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })

--[[ Macro ]]
vim.keymap.set("n", "Q", "@qj")
vim.keymap.set("x", "Q", ":norm @q<cr>")

--[[ Better Up/Down ]]
vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--[[ File Explorer ]]
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "File Explorer" })

--[[ Split window ]]
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<cr>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Split Horizontal" })

--[[ Move to window using the <ctrl> hjkl keys ]]
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up" })

--[[ Resize window using <ctrl> arrow keys ]]
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--[[ Move current line up/down ]]
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move current line down" })
-- vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move current line up" })
-- vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move current line down" })

--[[ Better indenting ]]
vim.keymap.set("v", "<", "<gv", { desc = "better indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "better indenting" })

--[[ Buffer ]]
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
end, { desc = "Delete Buffer" })

-- [[ Tab ]]
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Tab Previous" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabNext<cr>", { desc = "Tab Next" })

--[[ Format ]]
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format files" })

--[[ Code Action ]]
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })

--[[ Neogit ]]
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })

--[[ Diagnostic keymaps ]]
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

--[[ Trouble ]]
vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
    require("trouble").toggle "workspace_diagnostics"
end)
vim.keymap.set("n", "<leader>xd", function()
    require("trouble").toggle "document_diagnostics"
end)
vim.keymap.set("n", "<leader>xq", function()
    require("trouble").toggle "quickfix"
end)
vim.keymap.set("n", "<leader>xl", function()
    require("trouble").toggle "loclist"
end)
vim.keymap.set("n", "gR", function()
    require("trouble").toggle "lsp_references"
end)

--[[ Comment ]]
vim.keymap.set(
    "n",
    "<leader>/",
    "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
    { desc = "Toggle Comment" }
)
vim.keymap.set(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Toggle Comment" }
)
