-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-1>"] = false
lvim.keys.normal_mode["<A-2>"] = false
lvim.keys.normal_mode["<A-3>"] = false

lvim.builtin.terminal.open_mapping = "<c-t>"

lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

lvim.keys.normal_mode["<leader>\\"] = ":vsplit<CR>"
lvim.keys.visual_mode["<leader>p"] = [["_dP]] -- paste and keep
lvim.keys.normal_mode["<leader>y"] = [["+y]]
lvim.keys.visual_mode["<leader>y"] = [["+y]]
lvim.keys.normal_mode["<leader>Y"] = [["+Y]]
lvim.keys.normal_mode["<leader>d"] = [["_d]]
lvim.keys.insert_mode["<C-c>"] = "<Esc>"
lvim.keys.normal_mode["Q"] = "<nop>"

-- grep remap
lvim.keys.normal_mode["<leader>vg"] = [[:vimgrep // %:p<Left><Left><Left><Left><Left>]]

-- Quickfix navigation
lvim.keys.normal_mode["."] = "<cmd>cnext<CR>zz"
lvim.keys.normal_mode[","] = "<cmd>cprev<CR>zz"
lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
lvim.keys.normal_mode["<leader>j"] = "<cmd>lprev<CR>zz"

-- Find and replace
lvim.keys.normal_mode["<leader>fr"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- Make file executable
lvim.keys.normal_mode["<leader>x"] = "<cmd>!chmod +x %<CR>"

-- Swap splits
lvim.keys.normal_mode["<C-w><S-Left>"] = "<C-w>H"
lvim.keys.normal_mode["<C-w><S-Right>"] = "<C-w>L"
lvim.keys.normal_mode["<C-w><S-Up>"] = "<C-w>K"
lvim.keys.normal_mode["<C-w><S-Down>"] = "<C-w>J"

-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 2000 })
	end,
	"Format",
}
