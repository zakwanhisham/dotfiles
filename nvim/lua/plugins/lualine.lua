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
    hide_filename_extension = false,
    show_modifies_status = true,
    mode = 2,
    padding = {
        right = 0,
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

local mode = {
    "mode",
    fmt = function(str)
        return str:sub(1, 3)
    end,
}

require("lualine").setup {
    options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { mode, branch, buffers, diff },
        lualine_x = { diagnostics, filetype, location, progress },
        lualine_y = {},
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
