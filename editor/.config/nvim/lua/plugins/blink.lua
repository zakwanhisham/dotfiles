return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = { preset = "enter" },
        completion = {
            list = { selection = { preselect = false, auto_insert = false } },
            menu = { draw = { columns = { { "label", gap = 0 }, { "kind", gap = 0 } } } },
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            ghost_text = { enabled = false },
        },
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        signature = { enabled = false },
    },
}
