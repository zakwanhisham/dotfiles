local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require("mini.statusline").setup {
        content = {
            active = function()
                local MiniStatusline = require("mini.statusline")

                local git            = MiniStatusline.section_git { trunc_width = 40 }
                local diff           = MiniStatusline.section_diff { trunc_width = 75 }
                local diagnostics    = MiniStatusline.section_diagnostics { trunc_width = 75 }
                local lsp            = MiniStatusline.section_lsp { trunc_width = 75 }
                local filename       = MiniStatusline.section_filename { trunc_width = 140 }
                local location       = MiniStatusline.section_location { trunc_width = 75 }

                return MiniStatusline.combine_groups {
                    { hl = "MiniStatuslineFilename", strings = { filename } },
                    { hl = "MiniStatuslineFilename", strings = { lsp } },
                    { hl = "MiniStatuslineFilename", strings = { diagnostics } },
                    "%=",
                    { hl = "MiniStatuslineFilename", strings = { diff } },
                    { hl = "MiniStatuslineFilename", strings = { git } },
                    { hl = "MiniStatuslineFilename", strings = { location } },
                }
            end,
        },
        use_icons = false,
    }
end)

later(function()
    local clue = require("mini.clue")

    clue.setup {
        window = {
            config = {
                anchor = "SE",
                row = "auto",
                col = "auto",
                width = "auto",
                border = "bold",
            },
        },
        triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },
            -- Built-in completion
            { mode = "i", keys = "<C-x>" },
            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },
            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },
            -- Registers
            { mode = "n", keys = '"' },
            { mode = "x", keys = '"' },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },
            -- Window commands
            { mode = "n", keys = "<C-w>" },
            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
            -- `[` and `]` keys
            { mode = "n", keys = "[" },
            { mode = "n", keys = "]" },
            { mode = "x", keys = "[" },
            { mode = "x", keys = "]" },
        },
        clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            { mode = "n", keys = "<Leader>f", desc = "Fzf" },
            { mode = "n", keys = "<Leader>g", desc = "Git" },
            { mode = "n", keys = "<Leader>w", desc = "Whitespace" },
            clue.gen_clues.builtin_completion(),
            clue.gen_clues.g(),
            clue.gen_clues.marks(),
            clue.gen_clues.registers(),
            clue.gen_clues.windows(),
            clue.gen_clues.z(),
        },
    }
    require("mini.ai").setup { n_lines = 500 }
    require("mini.diff").setup {
        view = { style = "sign" },
        mappings = {
            goto_first = "[C",
            goto_prev = "[C",
            goto_next = "]c",
            goto_last = "]C",
        },
    }
    require("mini.indentscope").setup {}
    require("mini.surround").setup {}
    require("mini.trailspace").setup {}
end)
