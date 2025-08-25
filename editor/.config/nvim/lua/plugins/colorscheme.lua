local add, now = MiniDeps.add, MiniDeps.now

add { source = "sainnhe/gruvbox-material" }

now(function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_float_style = "bright"
    vim.g.gruvbox_material_disable_terminal_colors = 1
    vim.g.gruvbox_material_statusline_style = "original"
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd.colorscheme "gruvbox-material"
end)
