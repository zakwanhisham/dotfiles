local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings["a"] = {
	name = "Harpoon",
	a = { mark.add_file, "Mark file" },
	s = { ui.toggle_quick_menu, "Toggle quick menu" },
	q = {
		function()
			ui.nav_file(1)
		end,
		"File 1",
	},
	w = {
		function()
			ui.nav_file(2)
		end,
		"File 2",
	},
	e = {
		function()
			ui.nav_file(3)
		end,
		"File 3",
	},
	r = {
		function()
			ui.nav_file(4)
		end,
		"File 4",
	},
}
