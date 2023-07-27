local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings["a"] = {
	name = "Harpoon",
	a = { mark.add_file, "Mark file" },
	s = { ui.toggle_quick_menu, "Toggle quick menu" },
}
