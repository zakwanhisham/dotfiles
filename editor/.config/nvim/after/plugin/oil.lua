local add, now = MiniDeps.add, MiniDeps.now

add { source = "stevearc/oil.nvim" }

now(function()
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil" })

    require("oil").setup {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = { "permissions", "size", "birthtime" },
        view_options = { show_hidden = true, case_insensitive = true },
        keymaps = {
            ["q"] = "actions.close",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-k>"] = false,
            ["<C-j>"] = false,
        },
    }
end)
