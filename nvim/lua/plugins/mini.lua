return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
        require("mini.comment").setup {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
            mappings = {
                -- SOLUTION: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
                comment_line = "<C-_>", -- this equate to "<C-/>"
                comment_visual = "<C-_>", -- this equate to "<C-/>"
            },
        }

        require("mini.pairs").setup {}
        require("mini.surround").setup {}
        require("mini.indentscope").setup {}
    end,
}
