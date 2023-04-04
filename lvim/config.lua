-- vim options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.cmdheight = 1
vim.opt.spell = true
vim.opt.scrolloff = 999
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "rose-pine"

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-1>"] = false
lvim.keys.normal_mode["<A-2>"] = false
lvim.keys.normal_mode["<A-3>"] = false

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 2000 })
	end,
	"Format",
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true

-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = {
	components.filename,
	components.diff,
}
lvim.builtin.lualine.sections.lualine_x = {
	components.diagnostics,
	components.lsp,
	components.spaces,
	components.location,
}
lvim.builtin.lualine.sections.lualine_y = {
	components.filetype,
	components.treesitter,
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "eslint",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	{
		command = "prettierd",
		filetypes = {
			-- "javascript",
			-- "javascriptreact",
			-- "typescript",
			-- "typescriptreact",
			"css",
			"html",
			"markdown",
			"jsonc",
			"json",
			"yaml",
		},
	},
	{
		command = "gofmt",
		filetypes = { "go" },
	},
	{
		command = "clang-format",
		filetypes = { "cpp" },
	},
	{
		command = "rustfmt",
		filetypes = { "rust" },
	},
	{
		command = "stylua",
		filetypes = { "lua" },
	},
	{
		command = "shfmt",
		filetypes = { "sh" },
	},
	{
		command = "taplo",
		filetypes = { "toml" },
	},
})

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "eslint",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	{
		command = "golangci-lint",
		filetypes = { "go" },
	},
	{
		command = "clang-check",
		filetypes = { "cpp" },
	},
})

-- Additional Plugins
lvim.plugins = {
	{ "kdheepak/lazygit.nvim" },
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml" },
			})
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"folke/lsp-colors.nvim",
		event = "BufRead",
	},
	{
		"mrjones2014/nvim-ts-rainbow",
	},
	{ "rose-pine/neovim", as = "rose-pine" },
}
-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
