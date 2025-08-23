local add, now = MiniDeps.add, MiniDeps.now

add { source = "stevearc/oil.nvim" }

now(function()
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil" })

    require("oil").setup {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = { "permissions", "size", "birthtime" },
        keymaps = { ["q"] = "actions.close" },
        view_options = { show_hidden = true, case_insensitive = true },
    }
end)
