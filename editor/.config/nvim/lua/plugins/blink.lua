local function build_blink(params)
    vim.notify('Building blink.cmp', vim.log.levels.INFO)
    local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = params.path }):wait()
    if obj.code == 0 then
        vim.notify('Building blink.cmp done', vim.log.levels.INFO)
    else
        vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
    end
end

MiniDeps.add {
    source = "saghen/blink.cmp",
    depends = { "rafamadriz/friendly-snippets" },
    hooks = { post_install = build_blink, post_checkout = build_blink },
}

MiniDeps.later(function()
    require("blink.cmp").setup {
        keymap = { preset = "enter" },
        completion = {
            list = { selection = { preselect = false, auto_insert = false } },
            menu = { draw = { columns = { { "label", gap = 0 }, { "kind", gap = 0 } } } },
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            ghost_text = { enabled = false },
        },
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        signature = { enabled = false },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
end
)
