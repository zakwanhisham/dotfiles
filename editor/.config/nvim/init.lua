require "core.options"
require "core.keymaps"
require "core.autocommand"

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local plugins = vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins')
for _, plugin in ipairs(plugins) do
    if plugin:match('%.lua$') then
        local plugin_name = plugin:sub(1, -5) -- remove the .lua
        local ok, err = pcall(require, 'plugins.' .. plugin_name)
        if not ok then
            vim.api.nvim_echo('Error loading plugin ' .. plugin_name .. ': ' .. err, true, { err = true })
        end
    end
end
