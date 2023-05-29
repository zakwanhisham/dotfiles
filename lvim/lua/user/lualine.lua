local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = {
	components.filename,
	components.diff,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.diagnostics,
	components.lsp,
	components.spaces,
	components.location,
}
lvim.builtin.lualine.sections.lualine_y = {
	components.filetype,
	components.treesitter,
}
