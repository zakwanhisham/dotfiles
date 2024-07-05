return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        local mode = {
            "mode",
            fmt = function(str)
                return str:lower(str)
            end,
            cond = function()
                return vim.bo.modifiable
            end,
        }

        local branch = {
            "branch",
            icons_enabled = false,
            padding = {
                right = 1,
                left = 0,
            },
        }

        local diagnostics = {
            "diagnostics",
            symbols = {
                error = " ",
                warn = "  ",
                info = "󰋼 ",
                hint = "󰌵 ",
            },
            padding = {
                right = 0,
                left = 1,
            },
        }

        local diff = {
            "diff",
            symbols = {
                added = "󰐖 ",
                modified = "󱗜 ",
                removed = "󰍵 ",
            },
            padding = {
                right = 2,
                left = 1,
            },
        }

        local filename = {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 3,
        }

        local filetype = {
            "filetype",
            icons_enabled = false,
            padding = {
                right = 1,
                left = 0,
            },
        }

        local location = {
            "location",
            padding = {
                right = 1,
                left = 1,
            },
        }

        local progress = {
            "progress",
            padding = {
                right = 1,
                left = 0,
            },
        }

        require("lualine").setup {
            options = {
                theme = "kanagawa",
                always_divide_middle = true,
                component_separators = {
                    left = "",
                    right = "",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
                globalstatus = false,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = {},
                lualine_c = { filename, diagnostics },
                lualine_x = { diff, branch },
                lualine_y = {},
                lualine_z = { location, progress },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { filename },
                lualine_x = { filetype },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
