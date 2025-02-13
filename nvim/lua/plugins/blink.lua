return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "enter",
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            },
            menu = {
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              gap = 1 }
                    },
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
