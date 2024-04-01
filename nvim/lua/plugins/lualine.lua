local branch = {
    "branch",
    icons_enabled = true,
    padding = {
        right = 1,
        left = 0,
    },
}

local filetype = {
    "filetype",
    icons_enabled = true,
    padding = {
        right = 1,
        left = 0,
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
        right = 0,
        left = 1,
    },
}

local buffers = {
    "buffers",
    icons_enabled = false,
    show_filename_only = true,
    hide_filename_extension = true,
    show_modified_status = false,
    mode = 0,
    max_length = vim.o.columns * 1 / 4,
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
        theme = "auto",
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
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { filename, diagnostics },
        lualine_x = { location, progress },
        lualine_y = { diff, branch },
        lualine_z = { buffers },
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
