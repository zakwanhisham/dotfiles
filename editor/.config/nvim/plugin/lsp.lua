local add, now = MiniDeps.add, MiniDeps.now

add { source = "neovim/nvim-lspconfig", depends = { "mason-org/mason.nvim" } }

now(function()
    require("mason").setup {}

    -- [[ LSP  Keymaps ]]
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local nmap = function(keys, func, desc)
                if desc then desc = "LSP: " .. desc end

                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
            end

            nmap("grf", function() vim.lsp.buf.format { async = true } end, "Format")
            nmap("grr", "<cmd>FzfLua lsp_references ignore_current_line=true<cr>", "Reference")
            nmap("gd", "<cmd>FzfLua lsp_definitions jump1=true<cr>", "Definition")
        end
    })

    local servers = {
        bashls = {},
        clangd = {},
        eslint = {},
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
        vim.lsp.enable(server)
    end
end)
