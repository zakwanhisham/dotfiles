local add, now = MiniDeps.add, MiniDeps.now

add { source = "sainnhe/gruvbox-material" }

now(function()
    vim.o.background = "dark"

    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_float_style = "none"
    vim.g.gruvbox_material_disable_terminal_colors = 1
    vim.g.gruvbox_material_statusline_style = "original"
    vim.g.gruvbox_material_better_performance = 1

    vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
        pattern = 'gruvbox-material',
        callback = function()
            local config = vim.fn['gruvbox_material#get_configuration']()
            local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground,
                config.colors_override)
            local set_hl = vim.fn['gruvbox_material#highlight']

            set_hl('LineNrAbove', palette.fg0, palette.bg5)
            set_hl('LineNr', palette.yellow, palette.bg5)
            set_hl('LineNrBelow', palette.fg0, palette.bg5)
            set_hl('SignColumn', palette.none, palette.bg5)
        end
    })

    vim.cmd [[ colorscheme gruvbox-material ]]
end)
