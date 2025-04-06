return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    lazy = false,
    dependencies = {
        { "williamboman/mason.nvim",                  config = true }, -- Must be loaded before dependent
        { "williamboman/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        { "j-hui/fidget.nvim",                        opts = {} },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        }
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                end

                --[[
                -- USE DEFAULT ONE
                -- Code Action: `gra`
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

                nmap("K", vim.lsp.buf.hover, "Hover Documentation")

                -- Lesser used LSP functionality
                nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
                nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "Workspace List Folders")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
                if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                        end,
                    })
                end
            end,
        })

        local capabilities = vim.tbl_deep_extend("force", {}, require("blink.cmp").get_lsp_capabilities() or {})

        local servers = {
            bashls = {},
            clangd = {},
            golangci_lint_ls = {},
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            run_govulncheck = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        analyses = {
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                        semanticTokens = true,
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            basedpyright = {
                settings = {
                    basedpyright = {
                        openFilesOnly = true,
                        disableOrganizeImports = false,
                        analysis = {
                            autoImportCompletion = true,
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "off",
                            useLibraryCodeForTypes = true,
                            inlayHints = {
                                callArgumentNames = false,
                                functionReturnTypes = false,
                                genericTypes = false,
                                useTypingExtensions = false,
                            },
                        },
                    },
                },
            },
            -- pyright = {
            --     settings = {
            --         pyright = {
            --             openFilesOnly = true,
            --             disableOrganizeImports = false,
            --         },
            --         python = {
            --             analysis = {
            --                 autoImportCompletion = true,
            --                 autoSearchPaths = true,
            --                 diagnosticMode = "openFilesOnly",
            --                 typeCheckingMode = "off",
            --                 useLibraryCodeForTypes = true,
            --             },
            --         },
            --     },
            -- },
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers) or {}

        require("mason-tool-installer").setup { ensure_installed = ensure_installed, auto_update = true }

        require("mason-lspconfig").setup {
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        }
    end,
}
