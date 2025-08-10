local add, now = MiniDeps.add, MiniDeps.now

add { source = "lewis6991/gitsigns.nvim" }

now(function()
    local nmap = function(keymap, command, buffer, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set("n", keymap, command, {buffer = buffer, desc = desc })
    end

    local gitsigns = require("gitsigns")
    gitsigns.setup {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            nmap("<leader>gp", gitsigns.preview_hunk, bufnr, "Preview hunk")
            nmap("<leader>gb", gitsigns.blame, bufnr, "Blame")
            nmap("<leader>gl", gitsigns.blame_line, bufnr, "Blame line")
            nmap("<leader>gt", gitsigns.toggle_current_line_blame, bufnr, "Toggle blame line")

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
    }
end)
