local add, later = MiniDeps.add, MiniDeps.later

add { source = "mbbill/undotree" }

later(function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 50
    vim.g.undotree_DiffpanelHeight = 15

    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
end)
