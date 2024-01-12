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
        "codespell",
    },
}

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

nls.setup {
    root_dir = nls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
    sources = {
        --[[ formatting ]]
        formatting.stylua,
        formatting.shfmt,
        formatting.taplo,
        formatting.gofumpt,
        formatting.goimports,
        formatting.golines,
        formatting.prettierd.with {
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
        --[[ linting ]]
        diagnostics.golangci_lint,
        diagnostics.codespell,
        diagnostics.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc" }
            end,
            filter = function(diagnostic)
                return diagnostic.code ~= "prettierd/prettierd"
            end,
        },
        diagnostics.clang_check.with {
            extra_filetypes = { "h", "hpp", "cpp" },
        },
        --[[ code actions ]]
        actions.eslint_d,
    },
}
