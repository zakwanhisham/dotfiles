-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<S-l>"] = false
lvim.keys.normal_mode["<S-h>"] = false
lvim.keys.normal_mode["<A-1>"] = false
lvim.keys.normal_mode["<A-2>"] = false
lvim.keys.normal_mode["<A-3>"] = false

lvim.builtin.terminal.open_mapping = "<c-t>"

lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

lvim.builtin.which_key.mappings["\\"] = { ":vsplit<CR>", "Vertical Split" }
lvim.keys.normal_mode["Q"] = "<nop>"

-- Swap splits
lvim.keys.normal_mode["<C-w><S-Left>"] = "<C-w>H"
lvim.keys.normal_mode["<C-w><S-Right>"] = "<C-w>L"
lvim.keys.normal_mode["<C-w><S-Up>"] = "<C-w>K"
lvim.keys.normal_mode["<C-w><S-Down>"] = "<C-w>J"

lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 2000 })
	end,
	"Format",
}
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["b"] = {}
lvim.builtin.which_key.mappings["s"] = {}
lvim.builtin.which_key.mappings["h"] = {}

lvim.builtin.which_key.mappings["f"] = {
	name = "Find",
	f = { "<cmd>Telescope find_files<CR>", "Find Files" },
	g = { "<cmd>Telescope git_files<CR>", "Git Files" },
	t = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
	p = { "<cmd>Telescope projects<CR>", "Projects" },
	b = { "<cmd>Telescope buffers<CR>", "Buffer" },
	h = { "<cmd>Telescope help_tags<CR>", "Help" },
	r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
	R = { "<cmd>Telescope registers<CR>", "Registers" },
	M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
	C = { "<cmd>Telescope commands<CR>", "Commands" },
}
