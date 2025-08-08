local add, later = MiniDeps.add, MiniDeps.later

add { source = "github/copilot.vim" }

later(function()
    vim.g.copilot_workspace_folders = { vim.env.HOME .. "Work/landing" }
end)
