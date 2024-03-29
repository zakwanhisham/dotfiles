-- Remove deprecated command from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.cmd.setlocal "nonumber"
        vim.cmd.setlocal "norelativenumber"
    end,
    pattern = { "*" },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.bo.bufhidden = "unload"
        vim.cmd.wincmd "L"
        vim.cmd "vertical resize 81"
    end,
})

-- Create a command `:Format` local to the LSP buffer
-- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
--     vim.lsp.buf.format()
-- end, { desc = "Format current buffer with LSP" })
