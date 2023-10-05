local mason_nls = require "mason-null-ls"
local nls = require "null-ls"
local nls_utils = require "null-ls.utils"

mason_nls.setup {
    automatic_installation = true,
    ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "golangci-lint",
        "shfmt",
        "clang-format",
        "clang-check",
    },
}

local formatting = nls.builtins.formatting
local linter = nls.builtins.diagnostics

nls.setup {
    root_dir = nls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
    sources = {
        -- formatting
        formatting.prettierd.with {
            extra_filetypes = { "html", "css", "json", "markdown" },
        },
        formatting.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs" }
            end,
        },
        formatting.stylua,
        formatting.shfmt,
        formatting.clang_format,
        -- linting
        linter.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs" }
            end,
        },
        linter.golangci_lint,
        linter.clang_check,
    },
}
