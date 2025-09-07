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
                    "%<",
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
    require("mini.ai").setup {}
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
