vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", callback = function() vim.hl.on_yank {} end })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    callback = function()
        vim.cmd [[
            setlocal nofoldenable wrap nonumber norelativenumber nolist signcolumn=no colorcolumn=81
            wincmd L
            vertical resize 81
        ]]
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fugitiveblame", "git", "help", "qf", "term", "minideps-confirm" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fzf", "git", "gitcommit", "help", "man", "mason", "markdown", "term" },
    callback = function() vim.b.miniindentscope_disable = true end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match "^%w%w+:[\\/][\\/]" then return end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
