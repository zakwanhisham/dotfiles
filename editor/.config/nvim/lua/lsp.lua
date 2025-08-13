local lsps = vim.fn.readdir(vim.fn.stdpath("config") .. "/lsp")
for _, lsp in ipairs(lsps) do
    if lsp:match("%.lua$") then
        local lsp_name = lsp:sub(1, -5)
        local ok, err = pcall(vim.lsp.enable, lsp_name)
        if not ok then
            vim.api.nvim_echo("Error loading LSP " .. lsp_name .. ": " .. err, true, { err = true })
        end
    end
end

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
