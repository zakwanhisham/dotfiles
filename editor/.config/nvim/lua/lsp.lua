vim.lsp.enable({
    "bashls",
    "clangd",
    "eslint",
    "fish_lsp",
    "golangci_lint_ls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "taplo",
    "ts_ls",
})

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
