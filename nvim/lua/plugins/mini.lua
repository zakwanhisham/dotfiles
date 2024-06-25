return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    version = false,
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

        require("mini.pairs").setup {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        }

        require("mini.ai").setup { n_lines = 500 }
        require("mini.indentscope").setup { options = { try_as_border = true } }
        require("mini.surround").setup {}
    end,
}
