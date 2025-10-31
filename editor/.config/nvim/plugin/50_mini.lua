local now, later = MiniDeps.now, MiniDeps.later

later(function() require("mini.ai").setup {} end)

later(function()
    local MiniClue = require("mini.clue")
    MiniClue.setup {
        clues = {
            { mode = "n", keys = "<leader>f", desc = "+Fzf" },
            { mode = "n", keys = "<leader>g", desc = "+Git" },
            { mode = "n", keys = "<leader>t", desc = "+Trail" },
            MiniClue.gen_clues.square_brackets(),
            MiniClue.gen_clues.builtin_completion(),
            MiniClue.gen_clues.g(),
            MiniClue.gen_clues.marks(),
            MiniClue.gen_clues.registers(),
            MiniClue.gen_clues.windows(),
            MiniClue.gen_clues.z(),
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
end)

later(function() require("mini.comment").setup { options = { ignore_blank_line = true } } end)

later(function()
    require("mini.diff").setup {
        view = { style = "sign" },
        mappings = { goto_first = '[C', goto_prev = '[c', goto_next = ']c', goto_last = ']C' }
    }
end)

later(function()
    local MiniHipatterns = require("mini.hipatterns")
    MiniHipatterns.setup {
        highlighters = {
            fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
            hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
            todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
            note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
            MiniHipatterns.gen_highlighter.hex_color()
        }
    }
end)

later(function() require("mini.indentscope").setup {} end)

later(function() require("mini.move").setup {} end)

now(function()
    local MiniStatusline = require("mini.statusline")
    MiniStatusline.setup {
        content = {
            active = function()
                vim.cmd [[ hi MiniStatuslineModeNormal cterm=NONE gui=NONE ]]

                local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
                local diff        = MiniStatusline.section_diff { trunc_width = 75 }
                local filename    = MiniStatusline.section_filename { trunc_width = 140 }
                local git         = "%{FugitiveStatusline()}"
                local highlight   = "MiniStatuslineModeNormal"
                local location    = MiniStatusline.section_location { trunc_width = 75 }

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
            inactive = function()
                local filename  = MiniStatusline.section_filename { trunc_width = 140 }
                local highlight = "MiniStatuslineInactive"

                return MiniStatusline.combine_groups {
                    "%<",
                    { hl = highlight, strings = { filename } }
                }
            end,
        },
        use_icons = false,
    }
end)

later(function() require("mini.surround").setup {} end)

later(function()
    local MiniTrailspace = require("mini.trailspace")
    MiniTrailspace.setup {}

    local nmap = function(keymap, command, desc)
        if desc then desc = "Trail: " .. desc end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>tw", function() MiniTrailspace.trim() end, "Whitespace")
    nmap("<leader>tl", function() MiniTrailspace.trim_last_lines() end, "Last lines")
end)
