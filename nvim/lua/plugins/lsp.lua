return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    lazy = false,
    dependencies = {
        { "williamboman/mason.nvim", config = true }, -- Must be loaded before dependant
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
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
                -- To rename, use `grn`
                -- To find reference, use `grr`
                -- To do code action, use `gra`
                --]]

                nmap("<leader>lf", vim.lsp.buf.format, "Lsp Format")

                nmap("gd", vim.lsp.buf.definition, "Goto Definition")

                -- See `:help K` for why this keymap
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")

                -- Lesser used LSP functionality
                nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
                nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
                nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "Workspace List Folders")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                ---@diagnostic disable-next-line: missing-parameter
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            bashls = {},
            clangd = {
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            },
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
                            fieldalignment = true,
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
            jsonls = {
                settings = {
                    json = {
                        format = {
                            enable = true,
                        },
                        validate = { enable = true },
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
            marksman = {},
            basedpyright = {
                settings = {
                    basedpyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                        analysis = {
                            autoImportCompletion = true,
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "off",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
            taplo = {},
            yamlls = {},
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
