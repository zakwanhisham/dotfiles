local comment = require "mini.comment"

comment.setup {
    options = {
        custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
    },
    mappings = {
        -- SOLUTION: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
        comment_line = "<C-_>", -- this equate to "<C-/>"
        comment_visual = "<C-_>", -- this equate to "<C-/>"
    },
}
