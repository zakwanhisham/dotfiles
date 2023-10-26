local mason_nls = require "mason-null-ls"
local nls = require "null-ls"
local nls_utils = require "null-ls.utils"

mason_nls.setup {
    automatic_installation = true,
    ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "gofumpt",
        "goimports",
        "golines",
        "golangci-lint",
        "shfmt",
        "clang-format",
        "clang-check",
        "taplo",
    },
}

local formatting = nls.builtins.formatting
local linter = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

nls.setup {
    root_dir = nls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
    sources = {
        -- formatting
        formatting.stylua,
        formatting.shfmt,
        formatting.taplo,
        formatting.gofumpt,
        formatting.goimports,
        formatting.golines,
        formatting.prettierd.with {
            extra_filetypes = { "html", "css", "json", "markdown", "yaml" },
            condition = function(utils)
                return not utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc" }
            end,
        },
        formatting.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc" }
            end,
        },
        formatting.clang_format.with {
            extra_filetypes = { "h", "hpp", "cpp" },
        },
        -- linting
        linter.golangci_lint,
        linter.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc" }
            end,
            filter = function(diagnostics)
                return diagnostics.code ~= "prettierd/prettierd"
            end,
        },
        linter.clang_check.with {
            extra_filetypes = { "h", "hpp", "cpp" },
        },
        -- code actions
        actions.eslint_d,
    },
}
