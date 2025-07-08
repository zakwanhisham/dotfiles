return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" } },
    config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_SplitWidth = 50
        vim.g.undotree_DiffpanelHeight = 15
    end,
}
