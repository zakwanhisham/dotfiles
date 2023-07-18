local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = {
	-- components.filename,
	components.diff,
	components.diagnostics,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.lsp,
}
lvim.builtin.lualine.sections.lualine_y = {
	components.spaces,
	components.treesitter,
	components.filetype,
}
lvim.builtin.lualine.sections.lualine_z = {
	components.location,
	components.scrollbar,
}
