local now, later = MiniDeps.now, MiniDeps.later

now(function()
    require("mini.statusline").setup {
        content = {
            active = function()
                local MiniStatusline = require("mini.statusline")

                local diff           = MiniStatusline.section_diff { trunc_width = 75 }
                local diagnostics    = MiniStatusline.section_diagnostics { trunc_width = 75 }
                local lsp            = MiniStatusline.section_lsp { trunc_width = 75 }
                local filename       = MiniStatusline.section_filename { trunc_width = 140 }
                local location       = MiniStatusline.section_location { trunc_width = 75 }

                return MiniStatusline.combine_groups {
                    { hl = "MiniStatuslineModeNormal", strings = { filename } },
                    { hl = "MiniStatuslineModeNormal", strings = { lsp } },
                    { hl = "MiniStatuslineModeNormal", strings = { diagnostics } },
                    "%=",
                    { hl = "MiniStatuslineModeNormal", strings = { "%{FugitiveStatusline()}" } },
                    { hl = "MiniStatuslineModeNormal", strings = { diff } },
                    { hl = "MiniStatuslineModeNormal", strings = { location } },
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
    require("mini.ai").setup {}
    require("mini.comment").setup { options = { ignore_blank_line = true } }
    require("mini.diff").setup {
        view = { style = "sign" },
        mappings = {
            goto_first = '[C',
            goto_prev = '[c',
            goto_next = ']c',
            goto_last = ']C',
        }
    }
    require("mini.indentscope").setup {}
    require("mini.move").setup {}
    require("mini.surround").setup {}
    require("mini.trailspace").setup {}
end)
