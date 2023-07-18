-- lvim.builtin.lualine.style = "default"

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
	components.spaces,
}
lvim.builtin.lualine.sections.lualine_y = {
	components.treesitter,
	components.filetype,
}
lvim.builtin.lualine.sections.lualine_z = {
	components.location,
}
