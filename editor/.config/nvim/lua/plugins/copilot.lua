local add, later = MiniDeps.add, MiniDeps.later

add { source = "github/copilot.vim" }

later(function()
    vim.g.copilot_workspace_folders = { vim.env.HOME .. "Work/landing" }
    vim.g.copilot_filetypes = {
        ["*"] = true,
        ["markdown"] = false,
        ["text"] = false,
        ["gitcommit"] = false,
        ["gitrebase"] = false,
        ["diff"] = false,
    }
    vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)")
    vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
    vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")
end)
