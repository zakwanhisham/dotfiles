return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local branch = {
            "branch",
            icons_enabled = false,
            padding = { right = 1, left = 1 },
        }
        local diagnostics = {
            "diagnostics",
            symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            padding = { right = 0, left = 1 },
        }
        local diff = {
            "diff",
            padding = { right = 1, left = 1 },
        }
        local filename = {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1,
            padding = { right = 1, left = 1 },
        }
        local location = {
            "location",
            padding = { right = 1, left = 1 },
        }
        local progress = {
            "progress",
            padding = { right = 1, left = 1 },
        }
        require("lualine").setup {
            options = {
                theme = "auto",
                always_divide_middle = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = false,
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { filename, diagnostics },
                lualine_x = { diff, branch, location, progress },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { filename },
                lualine_x = { location, progress },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
