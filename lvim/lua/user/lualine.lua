local components = require("lvim.core.lualine.components")

local location = {
	"location",
	padding = {
		right = 1,
		left = 0,
	},
}

local filetype = {
	"filetype",
	padding = {
		right = 0,
		left = 1,
	},
}

local branch = {
	"branch",
	icons_enabled = false,
	padding = {
		right = 1,
		left = 1,
	},
}

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { branch }
lvim.builtin.lualine.sections.lualine_c = {
	components.diff,
	"%=",
	{
		"filename",
	},
}
lvim.builtin.lualine.sections.lualine_x = {
	components.diagnostics,
	components.lsp,
	components.spaces,
}
lvim.builtin.lualine.sections.lualine_y = {
	filetype,
	components.treesitter,
}
lvim.builtin.lualine.sections.lualine_z = {
	location,
}
