local lsp = {
    function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        local msg = "No Active LSP"
        local buf_client_names = {}

        if #buf_clients == 0 then
            return msg
        end

        for _, lsp_client in pairs(buf_clients) do
            if lsp_client.name ~= "null-ls" then
                table.insert(buf_client_names, lsp_client.name)
            end
        end

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        return language_servers
    end,
    padding = {
        right = 1,
        left = 0,
    },
}

local treesitter = {
    function()
        if next(vim.treesitter.highlighter.active) ~= nil then
            return " "
        end
        return " "
    end,
    padding = {
        right = 0,
        left = 1,
    },
}

local branch = {
    "branch",
    icons_enabled = false,
    padding = {
        right = 1,
        left = 1,
    },
}

local filetype = {
    "filetype",
    icons_enabled = true,
    padding = {
        right = 0,
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
        left = 0,
    },
}

local progress = {
    "progress",
    padding = {
        right = 0,
        left = 0,
    },
}

local mode = {
    "mode",
    fmt = function(str)
        return str:sub(1, 1)
    end
}

require("lualine").setup {
    options = {
        theme = "carbonfox",
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename, diff },
        lualine_x = { diagnostics, lsp },
        lualine_y = { filetype, treesitter },
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
