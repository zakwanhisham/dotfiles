-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.hl.on_yank {} end
})

-- [[ Close File]]
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fugitiveblame", "git", "help", "qf", "term", "minideps-confirm" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- [[ Mini-Indentscope ]]
-- Disable mini.indentscope on some of the file
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fzf", "git", "gitcommit", "help", "man", "mason", "term", "undotree" },
    callback = function() vim.b.miniindentscope_disable = true end,
})

-- [[ Auto create dir]]
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match "^%w%w+:[\\/][\\/]" then return end
        ---@diagnostic disable-next-line: undefined-field
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
