local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require("mini.statusline").setup {
        content = {
            active = function()
                local MiniStatusline = require("mini.statusline")

                local diagnostics    = MiniStatusline.section_diagnostics { trunc_width = 75 }
                local diff           = MiniStatusline.section_diff { trunc_width = 75 }
                local filename       = MiniStatusline.section_filename { trunc_width = 140 }
                local git            = "%{FugitiveStatusline()}"
                local highlight      = "MiniStatuslineModeNormal"
                local location       = MiniStatusline.section_location { trunc_width = 75 }

                vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#ebdbb2", fg = "#1d2021", bold = false })

                return MiniStatusline.combine_groups {
                    "%<",
                    { hl = highlight, strings = { filename } },
                    { hl = highlight, strings = { diagnostics } },
                    "%=",
                    { hl = highlight, strings = { diff } },
                    { hl = highlight, strings = { git } },
                    { hl = highlight, strings = { location } },
                }
            end,
        },
        use_icons = false,
    }
end)

later(function()
    require("mini.ai").setup {}
    local miniclue = require('mini.clue')
    miniclue.setup {
        clues = {
            { mode = "n", keys = "<leader>f", desc = "+Fzf" },
            { mode = "n", keys = "<leader>g", desc = "+Git" },
            { mode = "n", keys = "<leader>w", desc = "+Whitespace" },
            miniclue.gen_clues.square_brackets(),
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
        },
        triggers = {
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },
            { mode = 'n', keys = '[' },
            { mode = 'n', keys = ']' },
            { mode = 'i', keys = '<C-x>' },
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },
            { mode = 'n', keys = '<C-w>' },
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
        },
        window = { config = { anchor = "SE", width = "auto", row = "auto", col = "auto" } },
    }
    require("mini.comment").setup { options = { ignore_blank_line = true } }
    require("mini.diff").setup {
        view = { style = "sign" },
        mappings = { goto_first = '[C', goto_prev = '[c', goto_next = ']c', goto_last = ']C' }
    }
    require("mini.indentscope").setup {}
    require("mini.move").setup {}
    require("mini.surround").setup {}
    require("mini.trailspace").setup {}
end)
