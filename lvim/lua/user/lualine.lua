local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = {
	components.diagnostics,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.diff,
	components.spaces,
	"encoding",
}
lvim.builtin.lualine.sections.lualine_y = {
	components.filetype,
	components.treesitter,
}
lvim.builtin.lualine.sections.lualine_z = {
	components.location,
}
