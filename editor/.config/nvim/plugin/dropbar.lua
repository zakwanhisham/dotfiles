local add, later = MiniDeps.add, MiniDeps.later

add { source = "Bekaboo/dropbar.nvim" }

later(function()
    require("dropbar").setup {
        bar = {
            enable = function(buf, win, _)
                buf = vim._resolve_bufnr(buf)
                local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
                local exclude_filetypes = { "checkhealth","help", "terminal", "gitcommit", "NeogitDiffView" }

                if
                    not vim.api.nvim_buf_is_valid(buf)
                    or not vim.api.nvim_win_is_valid(win)
                    or (stat and stat.size > 1024 * 1024)
                    or vim.fn.win_gettype(win) ~= ""
                    or vim.wo[win].winbar ~= ""
                    or vim.tbl_contains(exclude_filetypes, vim.bo[buf].ft)
                then
                    return false
                end

                return vim.bo[buf].ft == "markdown"
                    or pcall(vim.treesitter.get_parser, buf)
                    or not vim.tbl_isempty(vim.lsp.get_clients({
                        bufnr = buf,
                        method = vim.lsp.protocol.Methods.textDocument_documentSymbol,
                    }))
            end
        }
    }
end)
