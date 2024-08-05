return {
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-mata/library", words = { "vim%.uv" } },
            },
        },
    },
}
