return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local mason_nls = require "mason-null-ls"
        local nls = require "null-ls"
        local nls_utils = require "null-ls.utils"

        mason_nls.setup {
            automatic_installation = true,
            ensure_installed = {
                "clang-format",
                "gofumpt",
                "goimports",
                "golangci-lint",
                "golines",
                "gomodifytags",
                "impl",
                "markdownlint",
                "prettier",
                "shfmt",
                "stylua",
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
                formatting.gofumpt,
                formatting.goimports,
                formatting.golines,
                formatting.prettier.with {
                    condition = function(utils)
                        return not utils.root_has_file {
                            ".eslintrc.js",
                            ".eslintrc.cjs",
                            ".eslintrc.json",
                            ".eslintrc",
                        }
                    end,
                },
                formatting.clang_format.with {
                    extra_filetypes = { "h", "hpp", "cpp" },
                },
                --[[ linting ]]
                diagnostics.golangci_lint,
                diagnostics.markdownlint,
                --[[ code actions ]]
                actions.gomodifytags,
                actions.impl,
            },
        }
    end,
}
