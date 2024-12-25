-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local yank_highlight = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_highlight,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- [[ Terminal ]]
-- Remove number and relative number when `:term` is open
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        vim.cmd.setlocal "nonumber"
        vim.cmd.setlocal "norelativenumber"
    end,
})

-- [[ Help File ]]
-- Open Vim Help file vertically on the right
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.bo.bufhidden = "unload"
        vim.cmd.wincmd "L"
        vim.cmd "vertical resize 120"
    end,
})

-- [[ Close File]]
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "lspinfo",
        "qf",
        "term",
        "gitsigns-blame",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- [[ Mini-Indentscope ]]
-- Disable mini.indentscope on some of the file
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "Trouble",
        "gitcommit",
        "help",
        "lazy",
        "man",
        "mason",
        "term",
        "trouble",
        "fzf",
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
        ---@diagnostic disable-next-line: undefined-field
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
