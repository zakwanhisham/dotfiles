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
		filetypes = {
			"cpp",
			"c",
		},
	},
})
