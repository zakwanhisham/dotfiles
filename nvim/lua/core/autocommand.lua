vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})

-- hightlight yanked text for 200ms using the "Visual" hightlighting group
vim.cmd [[
    augroup hightlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", time=200})
    augroup END
]]

-- open netrw when there's no file
-- vim.cmd [[
--     augroup ProjectDrawer
--         autocmd!
--         au VimEnter * if argc() == 0 | Explore! | endif
--     augroup END
-- ]]

--[[ vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.sh", "*.zsh" },
    command = "silent! set filetype=sh",
}) ]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = "*",
-- })
