-- MINIMAL
-- created on https://nvimcolors.com

-- Clear existing highlights and reset syntax
vim.cmd('highlight clear')
vim.cmd('syntax reset')

-- Basic UI elements
vim.cmd('highlight Normal guibg=#1a1a1a guifg=#cccccc')
vim.cmd('highlight NonText guibg=#1a1a1a guifg=#1a1a1a')
vim.cmd('highlight CursorLine guibg=#2c2c2c')
vim.cmd('highlight LineNr guifg=#737373')
vim.cmd('highlight CursorLineNr guifg=#cccccc')
vim.cmd('highlight SignColumn guibg=#1a1a1a')
vim.cmd('highlight StatusLine gui=bold guibg=#8f8f8f guifg=#1a1a1a')
vim.cmd('highlight StatusLineNC gui=bold guibg=#8f8f8f guifg=#555555')
vim.cmd('highlight Directory guifg=#769fd2')
vim.cmd('highlight Visual guibg=#4f4f4f')
vim.cmd('highlight Search guibg=#737373 guifg=#cccccc')
vim.cmd('highlight CurSearch guibg=#cccccc guifg=#1a1a1a')
vim.cmd('highlight IncSearch gui=None guibg=#cccccc guifg=#1a1a1a')
vim.cmd('highlight MatchParen guibg=#737373 guifg=#cccccc')
vim.cmd('highlight Pmenu guibg=#484848 guifg=#cccccc')
vim.cmd('highlight PmenuSel guibg=#707070 guifg=#cccccc')
vim.cmd('highlight PmenuSbar guibg=#707070 guifg=#cccccc')
vim.cmd('highlight VertSplit guifg=#8f8f8f')
vim.cmd('highlight MoreMsg guifg=#b09ac1')
vim.cmd('highlight Question guifg=#b09ac1')
vim.cmd('highlight Title guifg=#cccccc')

-- Syntax highlighting
vim.cmd('highlight Comment guifg=#737373 gui=italic')
vim.cmd('highlight Constant guifg=#cccccc')
vim.cmd('highlight Identifier guifg=#cccccc')
vim.cmd('highlight Statement guifg=#cccccc')
vim.cmd('highlight PreProc guifg=#cccccc')
vim.cmd('highlight Type guifg=#cccccc gui=None')
vim.cmd('highlight Special guifg=#b09ac1')

-- Refined syntax highlighting
vim.cmd('highlight String guifg=#80c180')
vim.cmd('highlight Number guifg=#cccccc')
vim.cmd('highlight Boolean guifg=#cccccc')
vim.cmd('highlight Function guifg=#c97781')
vim.cmd('highlight Keyword guifg=#f5db9d gui=italic')

-- Html syntax highlighting
vim.cmd('highlight Tag guifg=#769fd2')
vim.cmd('highlight @tag.delimiter guifg=#efc96c')
vim.cmd('highlight @tag.attribute guifg=#cccccc')

-- Messages
vim.cmd('highlight ErrorMsg guifg=#ff4d4d')
vim.cmd('highlight Error guifg=#ff4d4d')
vim.cmd('highlight DiagnosticError guifg=#ff4d4d')
vim.cmd('highlight DiagnosticVirtualTextError guibg=#311f1f guifg=#ff4d4d')
vim.cmd('highlight WarningMsg guifg=#ffdb4d')
vim.cmd('highlight DiagnosticWarn guifg=#ffdb4d')
vim.cmd('highlight DiagnosticVirtualTextWarn guibg=#312d1f guifg=#ffdb4d')
vim.cmd('highlight DiagnosticInfo guifg=#4ddbff')
vim.cmd('highlight DiagnosticVirtualTextInfo guibg=#1f2d31 guifg=#4ddbff')
vim.cmd('highlight DiagnosticHint guifg=#4dffff')
vim.cmd('highlight DiagnosticVirtualTextHint guibg=#1f3131 guifg=#4dffff')
vim.cmd('highlight DiagnosticOk guifg=#4dff4d')

-- Common plugins
vim.cmd('highlight CopilotSuggestion guifg=#737373') -- Copilot suggestion
vim.cmd('highlight TelescopeSelection guibg=#4f4f4f') -- Telescope selection
