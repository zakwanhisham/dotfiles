local function get_if_available(name, opts)
    local lua_ok, colorscheme = pcall(require, name)
    if lua_ok then
        colorscheme.setup(opts)
        return name
    end

    local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
    if vim_ok then
        return name
    end

    return "default"
end

local carbonfox = require("plugins.themes").name

local colorscheme = get_if_available(carbonfox)

return colorscheme
