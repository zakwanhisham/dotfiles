local components = require("lvim.core.lualine.components")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local location = {
	"location",
	padding = 0,
}

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = {
	components.diff,
	diagnostics,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.lsp,
	components.spaces,
	components.filetype,
}
lvim.builtin.lualine.sections.lualine_y = {
	components.treesitter,
	location,
}
lvim.builtin.lualine.sections.lualine_z = {
	"progress",
}
