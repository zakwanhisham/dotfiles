local add, now = MiniDeps.add, MiniDeps.now

add { source = "lewis6991/gitsigns.nvim" }

now(function()
    local nmap = function(keymap, command, buffer, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set("n", keymap, command, { buffer = buffer, desc = desc })
    end

    local nvmap = function(keymap, command, buffer, desc)
        if desc then
            desc = "Git: " .. desc
        end

        vim.keymap.set({ "n", "v" }, keymap, command, { expr = true, buffer = buffer, desc = desc })
    end

    local gitsigns = require("gitsigns")
    gitsigns.setup {
        signs = {
            add          = { text = '▒' },
            change       = { text = '▒' },
            delete       = { text = '▒' },
            topdelete    = { text = '▒' },
            changedelete = { text = '▒' },
            untracked    = { text = '▒' },
        },
        signs_staged = {
            add          = { text = '▒' },
            change       = { text = '▒' },
            delete       = { text = '▒' },
            topdelete    = { text = '▒' },
            changedelete = { text = '▒' },
            untracked    = { text = '▒' },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            nmap("<leader>gp", gitsigns.preview_hunk, bufnr, "Preview hunk")
            nmap("<leader>gb", gitsigns.blame, bufnr, "Blame")
            nmap("<leader>gl", gitsigns.blame_line, bufnr, "Blame line")
            nmap("<leader>gt", gitsigns.toggle_current_line_blame, bufnr, "Toggle blame line")

            nvmap("]c", function()
                if vim.wo.diff then return "]c" end
                vim.schedule(function() gs.next_hunk() end)

                return "<Ignore>"
            end, bufnr, "Jump to next hunk")
            nvmap("[c", function()
                if vim.wo.diff then return "[c" end
                vim.schedule(function() gs.prev_hunk() end)

                return "<Ignore>"
            end, bufnr, "Jump to next hunk")
        end,
    }
end)
