local branch = {
    "branch",
    icons_enabled = true,
    padding = {
        right = 1,
        left = 1,
    },
}

local filetype = {
    "filetype",
    icons_enabled = true,
    padding = {
        right = 1,
        left = 1,
    },
}

local diagnostics = {
    "diagnostics",
    symbols = {
        error = " ",
        warn = " ",
        info = "󰋼 ",
        hint = "󰌵 ",
    },
    padding = {
        right = 1,
        left = 0,
    },
}

local buffers = {
    "buffers",
    icons_enabled = false,
    show_filename_only = true,
    hide_filename_extension = true,
    show_modified_status = false,
    mode = 0,
    max_length = vim.o.columns * 2 / 3,
    padding = {
        right = 1,
        left = 1,
    },
}

local filename = {
    "filename",
    file_status = true,
    newfile_status = true,
    path = 1,
}

local diff = {
    "diff",
    symbols = {
        added = "󰐖 ",
        modified = "󱗜 ",
        removed = "󰍵 ",
    },
}

local location = {
    "location",
    padding = {
        right = 0,
        left = 0,
    },
}

local progress = {
    "progress",
    padding = {
        right = 1,
        left = 1,
    },
}

require("lualine").setup {
    options = {
        theme = "auto",
        component_separators = {
            left = "|",
            right = "",
        },
        section_separators = {
            left = "",
            right = "",
        },
        globalstatus = false,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename, branch, diff },
        lualine_x = { diagnostics, filetype, location, progress },
        lualine_y = { buffers },
        lualine_z = {},
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
