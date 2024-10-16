return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    version = false,
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-lua/plenary.nvim", lazy = true },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable "make" == 1
            end,
        },
    },
    config = function()
        local actions = require "telescope.actions"
        local builtin = require "telescope.builtin"
        local themes = require "telescope.themes"

        require("telescope").setup {
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules" },
                preview = {
                    filesize_limit = 0.1, -- MB
                },
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-y>"] = actions.select_default,
                        ["<esc>"] = actions.close,
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim", -- add this value
                },
            },
            pickers = {
                buffers = {
                    ignore_current_buffer = true,
                    sort_mru = true,
                    sort_lastused = true,
                },
            },
            extensions = {
                ["ui-select"] = {
                    themes.get_dropdown {
                        winblend = 0,
                        previewer = false,
                    },
                },
            },
        }

        -- Call extensions
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- Telescope
        vim.keymap.set("n", "<leader><space>", function()
            builtin.buffers(themes.get_dropdown {
                winblend = 0,
                previewer = false,
            })
        end, { desc = "Buffer" })
        vim.keymap.set("n", "<leader>ff", function()
            local opts = themes.get_dropdown {
                winblend = 0,
                previewer = false,
            }
            builtin.find_files(opts)
        end, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fs", function()
            builtin.live_grep(themes.get_dropdown {
                winblend = 0,
                previewer = true,
            })
        end, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fw", function()
            builtin.grep_string(themes.get_dropdown {
                winblend = 0,
                previewer = true,
            })
        end, { desc = "Grep String" })
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown {
                winblend = 0,
                previewer = false,
            })
        end, { desc = "Fuzzy search" })
    end,
}
