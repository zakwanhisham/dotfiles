local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings["a"] = { mark.add_file, "Harpoon" }
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-q>", function()
	ui.nav_file(1)
end)

vim.keymap.set("n", "<C-w>", function()
	ui.nav_file(2)
end)

vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(3)
end)
