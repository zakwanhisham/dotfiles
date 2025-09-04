vim.cmd [[
    setlocal colorcolumn=50 spell wrap
    setlocal foldmethod=expr foldexpr=v:lua.MiniGit.diff_foldexpr() foldlevel=1
]]

