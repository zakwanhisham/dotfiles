-- MINIMAL
-- created on https://nvimcolors.com

-- Clear existing highlights and reset syntax
vim.cmd('highlight clear')
vim.cmd('syntax reset')

-- Basic UI elements
vim.cmd('highlight Normal guibg=#1d2021 guifg=#ebdbb2')
vim.cmd('highlight NonText guibg=#1d2021 guifg=#1d2021')
vim.cmd('highlight CursorLine guibg=#333532')
vim.cmd('highlight LineNr guifg=#847e6a')
vim.cmd('highlight CursorLineNr guifg=#ebdbb2')
vim.cmd('highlight SignColumn guibg=#1d2021')
vim.cmd('highlight StatusLine gui=bold guibg=#ebdbb2 guifg=#1d2021')
vim.cmd('highlight StatusLineNC gui=bold guibg=#ebdbb2 guifg=#847e6a')
vim.cmd('highlight Directory guifg=#458588')
vim.cmd('highlight Visual guibg=#5b584d')
vim.cmd('highlight Search guibg=#847e6a guifg=#ebdbb2')
vim.cmd('highlight CurSearch guibg=#fabd2f guifg=#1d2021')
vim.cmd('highlight IncSearch gui=None guibg=#fabd2f guifg=#1d2021')
vim.cmd('highlight MatchParen guibg=#847e6a guifg=#ebdbb2')
vim.cmd('highlight Pmenu guibg=#4a4d4d guifg=#ebdbb2')
vim.cmd('highlight PmenuSel guibg=#7a786b guifg=#ebdbb2')
vim.cmd('highlight PmenuSbar guibg=#7a786b guifg=#ebdbb2')
vim.cmd('highlight VertSplit guifg=#ebdbb2')
vim.cmd('highlight MoreMsg guifg=#83a598')
vim.cmd('highlight Question guifg=#83a598')
vim.cmd('highlight Title guifg=#d5c4a1')

-- Syntax highlighting
vim.cmd('highlight Comment guifg=#847e6a gui=italic')
vim.cmd('highlight Constant guifg=#fbf1c7')
vim.cmd('highlight Identifier guifg=#d5c4a1')
vim.cmd('highlight Statement guifg=#b16286')
vim.cmd('highlight PreProc guifg=#b16286')
vim.cmd('highlight Type guifg=#fabd2f gui=None')
vim.cmd('highlight Special guifg=#83a598')

-- Refined syntax highlighting
vim.cmd('highlight String guifg=#98971a')
vim.cmd('highlight Number guifg=#fabd2f')
vim.cmd('highlight Boolean guifg=#8ec07c')
vim.cmd('highlight Function guifg=#d3869b')
vim.cmd('highlight Keyword guifg=#83a598 gui=italic')

-- Html syntax highlighting
vim.cmd('highlight Tag guifg=#d5c4a1')
vim.cmd('highlight @tag.delimiter guifg=#83a598')
vim.cmd('highlight @tag.attribute guifg=#d3869b')

-- Messages
vim.cmd('highlight ErrorMsg guifg=#fb4934')
vim.cmd('highlight Error guifg=#fb4934')
vim.cmd('highlight DiagnosticError guifg=#fb4934')
vim.cmd('highlight DiagnosticVirtualTextError guibg=#332423 guifg=#fb4934')
vim.cmd('highlight WarningMsg guifg=#fabd2f')
vim.cmd('highlight DiagnosticWarn guifg=#fabd2f')
vim.cmd('highlight DiagnosticVirtualTextWarn guibg=#333022 guifg=#fabd2f')
vim.cmd('highlight DiagnosticInfo guifg=#458588')
vim.cmd('highlight DiagnosticVirtualTextInfo guibg=#212a2b guifg=#458588')
vim.cmd('highlight DiagnosticHint guifg=#83a598')
vim.cmd('highlight DiagnosticVirtualTextHint guibg=#272d2d guifg=#83a598')
vim.cmd('highlight DiagnosticOk guifg=#8ec07c')

-- Common plugins
vim.cmd('highlight CopilotSuggestion guifg=#847e6a') -- Copilot suggestion
vim.cmd('highlight TelescopeSelection guibg=#5b584d') -- Telescope selection
