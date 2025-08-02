return {
    {
        "echasnovski/mini.clue",
        version = false,
        config = function()
            require("mini.clue").setup {
                window = {
                    config = {
                        anchor = "SE",
                        row = "auto",
                        col = "auto",
                        width = "auto",
                        border = "bold",
                    },
                },
                triggers = {
                    -- Leader triggers
                    { mode = "n", keys = "<Leader>" },
                    { mode = "x", keys = "<Leader>" },
                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },
                    -- `g` key
                    { mode = "n", keys = "g" },
                    { mode = "x", keys = "g" },
                    -- Marks
                    { mode = "n", keys = "'" },
                    { mode = "n", keys = "`" },
                    { mode = "x", keys = "'" },
                    { mode = "x", keys = "`" },
                    -- Registers
                    { mode = "n", keys = '"' },
                    { mode = "x", keys = '"' },
                    { mode = "i", keys = "<C-r>" },
                    { mode = "c", keys = "<C-r>" },
                    -- Window commands
                    { mode = "n", keys = "<C-w>" },
                    -- `z` key
                    { mode = "n", keys = "z" },
                    { mode = "x", keys = "z" },
                },
                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    { mode = "n", keys = "<Leader>f", desc = "Fzf" },
                    { mode = "n", keys = "<Leader>g", desc = "Git" },
                    { mode = "n", keys = "<Leader>w", desc = "Whitespace" },
                    require("mini.clue").gen_clues.builtin_completion(),
                    require("mini.clue").gen_clues.g(),
                    require("mini.clue").gen_clues.marks(),
                    require("mini.clue").gen_clues.registers(),
                    require("mini.clue").gen_clues.windows(),
                    require("mini.clue").gen_clues.z(),
                },
            }
        end
    },
    {
        "echasnovski/mini.ai",
        version = false,
        config = function()
            require("mini.ai").setup { n_lines = 500 }
        end
    },
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup {}
        end
    },
    {
        "echasnovski/mini.trailspace",
        version = false,
        config = function()
            require("mini.trailspace").setup {}

            vim.keymap.set("n", "<leader>wt", function() require("mini.trailspace").trim() end,
                { desc = "Trim trailing whitespace" })
            vim.keymap.set("n", "<leader>wl", function() require("mini.trailspace").trim_last_lines() end,
                { desc = "Trim last blank lines" })
        end
    },
}
