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

-- [[ Terminal ]]
-- Remove number and relative number when `:term` is open
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.cmd.setlocal "nonumber"
        vim.cmd.setlocal "norelativenumber"
    end,
    pattern = { "*" },
})

-- [[ Help File ]]
-- Open Vim Help file vertically on the right
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.bo.bufhidden = "unload"
        vim.cmd.wincmd "L"
        vim.cmd "vertical resize 81"
    end,
})

-- [[ Mini-Indentscope ]]
-- Disable mini.indentscope on some of the file
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "man",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

-- [[ Resize ]]
-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd "tabdo wincmd ="
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- [[ Auto create dir]]
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match "^%w%w+:[\\/][\\/]" then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Create a command `:Format` local to the LSP buffer
-- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
--     vim.lsp.buf.format()
-- end, { desc = "Format current buffer with LSP" })
