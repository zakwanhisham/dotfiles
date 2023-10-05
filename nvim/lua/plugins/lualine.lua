local lsp = {
    function()
        local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
        local msg = "No Active LSP"
        local buf_client_names = {}

        if #buf_clients == 0 then
            return msg
        end

        for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" then
                table.insert(buf_client_names, client.name)
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
        left = 0,
    },
}

local location = {
    "location",
    padding = {
        right = 1,
        left = 0,
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

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { branch },
        lualine_c = { "diff", "%=", { "filename" } },
        lualine_x = { "diagnostics", lsp },
        lualine_y = { "filetype", treesitter },
        lualine_z = { location },
    },
}
