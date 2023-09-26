-- set a formatter, this will override the language server formatting capabilities (if it exists)

lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 2000 })
	end,
	"Format",
}

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "eslint_d",
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
		filetypes = {
			"cpp",
			"c",
		},
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
		command = "eslint_d",
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
		filetypes = {
			"cpp",
			"c",
		},
	},
})
