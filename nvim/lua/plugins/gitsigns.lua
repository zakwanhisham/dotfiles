return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk,
                { buffer = bufnr, desc = "Preview git hunk" })
            vim.keymap.set("n", "<leader>gb", require("gitsigns").blame, { buffer = bufnr, desc = "Git blame" })

            local gs = package.loaded.gitsigns
            vim.keymap.set({ "n", "v" }, "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
            vim.keymap.set({ "n", "v" }, "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
        end,
    },
}
