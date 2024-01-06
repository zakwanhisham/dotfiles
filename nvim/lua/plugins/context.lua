require("treesitter-context").setup {
    enable = true,
    max_lines = 3,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = nil,
    zindex = 20,
    patterns = {
        default = {
            "class",
            "function",
            "method",
        },
    },
}
