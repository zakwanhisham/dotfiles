local add, later = MiniDeps.add, MiniDeps.later

add {
    source = "saghen/blink.cmp",
    depends = { "rafamadriz/friendly-snippets" },
    checkout = "*",
}

later(function()
    require("blink.cmp").setup {
        keymap = { preset = "enter" },
        completion = {
            list = { selection = { preselect = false, auto_insert = false } },
            menu = { draw = { columns = { { "label", gap = 0 }, { "kind", gap = 0 } } } },
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            ghost_text = { enabled = false },
        },
        sources = { default = { "lsp", "snippets", "buffer", "path" } },
        signature = { enabled = false },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
end)
