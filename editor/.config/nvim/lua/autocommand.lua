-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
local yank_highlight = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_highlight,
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- [[ Terminal ]]
-- Remove number and relative number when `:term` is open
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        vim.cmd [[startinsert]]
        vim.cmd.setlocal "nonumber"
        vim.cmd.setlocal "norelativenumber"
    end,
})

-- [[ Close File]]
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fugitiveblame", "git", "help", "qf", "term" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- [[ Mini-Indentscope ]]
-- Disable mini.indentscope on some of the file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fzf", "git", "gitcommit", "help", "man", "mason", "term" },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

-- [[ Help file ]]
-- Open help file vertically
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "help", "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then vim.cmd.wincmd("L") end
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
        ---@diagnostic disable-next-line: undefined-field
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
