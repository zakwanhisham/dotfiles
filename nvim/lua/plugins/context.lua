require("treesitter-context").setup {
    enable = true,
    throttle = true,
    max_lines = 3,
    mode = "cursor",
    patterns = {
        default = {
            "class",
            "function",
            "method",
        },
    },
}
