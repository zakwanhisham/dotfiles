return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register({
                ["<leader>"] = {
                    f = { name = "File" },
                    s = { name = "Search" },
                    l = { name = "LSP" },
                    g = { name = "Git" },
                },
            })
        end,
    },
}
