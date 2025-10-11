local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add { source = "neovim/nvim-lspconfig", depends = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" } }

    require("mason").setup {}

    -- [[ LSP  Keymaps ]]
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local nmap = function(keys, func, desc)
                if desc then desc = "Lsp: " .. desc end

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
        protols = {},
        pyright = {
            settings = {
                pyright = {
                    openFilesOnly = true,
                    disableOrganizeImports = false,
                },
                python = {
                    analysis = {
                        -- Options are: [off, basic, standard, strict]
                        typeCheckingMode = "off",
                    },
                },
            },
        },
        rust_analyzer = {},
        ts_ls = {},
    }

    for server, config in pairs(servers) do vim.lsp.config(server, config) end

    require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers), automatic_enable = true }
end)
