return {
    "nvim-telescope/telescope.nvim",
    event = "BufEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
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
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
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
            local is_inside_work_tree = {}
            local opts = themes.get_dropdown {
                winblend = 0,
                previewer = false,
            }

            local cwd = vim.fn.getcwd()
            if is_inside_work_tree[cwd] == nil then
                vim.fn.system "git rev-parse --is-inside-work-tree"
                is_inside_work_tree[cwd] = vim.v.shell_error == 0
            end

            if is_inside_work_tree[cwd] then
                builtin.git_files(opts)
            else
                builtin.find_files(opts)
            end
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
        end, { desc = "Fuzzy search in current buffer" })
    end,
}
