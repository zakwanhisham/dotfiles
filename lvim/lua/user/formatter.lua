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
	{
		command = "nimpretty",
		filetypes = { "nim" },
	},
})
