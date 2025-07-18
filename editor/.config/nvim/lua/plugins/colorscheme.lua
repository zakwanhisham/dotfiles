return {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_foreground = "original"
        vim.g.gruvbox_material_dim_inactive_windows = 1
        vim.g.gruvbox_material_ui_contrast = "high"
        vim.g.gruvbox_material_float_style = "dim"
        vim.g.gruvbox_material_statusline_style = "original"
        vim.g.gruvbox_material_better_performance = 1

        vim.cmd.colorscheme "gruvbox-material"
    end
}
