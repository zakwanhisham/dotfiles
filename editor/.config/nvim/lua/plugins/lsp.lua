local add, now = MiniDeps.add, MiniDeps.now

add {
    source = "neovim/nvim-lspconfig",
    depends = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
}

now(function()
    require("mason").setup {}

    -- [[ LSP  Keymaps ]]
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
            end

            --[[
            --USE Default LSP Keymaps
            -- Code Actions: `gra`
            -- Rename: `grn`
            -- Implementation: `gri`
            --]]

            nmap("grf", vim.lsp.buf.format, "Format")
            nmap("grr", function()
                require("fzf-lua").lsp_references({ ignore_current_line = true })
            end, "Reference")
            nmap("gd", function()
                require("fzf-lua").lsp_definitions({ jump1 = true })
            end, "Goto Definition")
            nmap("gD", "<cmd>FzfLua lsp_declarations<cr>", "Goto Declaration")
        end
    })

    local servers = {
        bashls = {},
        clangd = {},
        eslint = {},
        fish_lsp = {},
        golangci_lint_ls = {},
        gopls = {},
        lua_ls = {
            settings = {
                Lua = {
                    workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                    diagnostics = { globals = { 'vim' } },
                    telemetry = { enable = false },
                },
            },
        },
        pyright = {
            settings = {
                pyright = {
                    openFilesOnly = true,
                    disableOrganizeImports = false,
                },
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = 'openFilesOnly',
                        typeCheckingMode = 'off',
                    },
                },
            },
        },
        ts_ls = {},
    }

    for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        require("mason-lspconfig").setup {
            ensure_installed = { server },
            automatic_enable = { server },
        }
    end
end)
