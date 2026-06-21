vim.schedule(function()
    vim.treesitter.stop()
    vim.cmd [[ setlocal colorcolumn=50,72 textwidth=72 spell wrap signcolumn=no foldmethod=expr foldexpr=v:lua.MiniGit.diff_foldexpr() foldlevel=1 ]]
end)
