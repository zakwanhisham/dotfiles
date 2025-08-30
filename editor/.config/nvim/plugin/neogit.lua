local add, later = MiniDeps.add, MiniDeps.later

add { source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } }

later(function()
    require("neogit").setup {}

    vim.keymap.set("n", "<leader>gg" ,"<cmd>Neogit<cr>", { desc = "Git: Neogit" })
end)
