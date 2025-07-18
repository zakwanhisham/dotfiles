return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk,
                { buffer = bufnr, desc = "Preview git hunk" })
            vim.keymap.set("n", "<leader>gb", require("gitsigns").blame,
                { buffer = bufnr, desc = "Git blame" })
            vim.keymap.set("n", "<leader>gl", require("gitsigns").blame_line,
                { buffer = bufnr, desc = "Git blame line" })
            vim.keymap.set("n", "<leader>gt", require("gitsigns").toggle_current_line_blame,
                { buffer = bufnr, desc = "Toggle current line blame" })

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
