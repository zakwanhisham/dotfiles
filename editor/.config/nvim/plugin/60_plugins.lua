local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

later(function()
    local function build_blink(params)
        vim.notify('Building blink.cmp', vim.log.levels.INFO)
        local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = params.path }):wait()
        if obj.code == 0 then
            vim.notify('Building blink.cmp done', vim.log.levels.INFO)
        else
            vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
        end
    end

    add {
        source = "saghen/blink.cmp",
        depends = { "rafamadriz/friendly-snippets" },
        hooks = { post_install = build_blink, post_checkout = build_blink }
    }

    require("blink.cmp").setup {
        keymap = { preset = "enter" },
        completion = {
            list = { selection = { preselect = false, auto_insert = false } },
            menu = { border = "none", draw = { columns = { { "label", gap = 0 }, { "kind", gap = 0 } } } },
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            ghost_text = { enabled = false },
        },
        sources = { default = { "lsp", "snippets", "buffer", "path" } },
        signature = { enabled = false },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
end)

later(function()
    add { source = "ibhagwan/fzf-lua" }

    require("fzf-lua").setup {
        { "fzf-vim", "hide" },
        winopts = { height = 0.4, width = 1, row = 1, border = "border-top", backdrop = 100 },
        keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
    }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Fzf: " .. desc end
        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader><space>", "<cmd>Buffers<cr>", "Buffers")
    nmap("<leader>ff", "<cmd>Files<cr>", "Files")
    nmap("<leader>fg", "<cmd>GFiles<cr>", "Git Files")
    nmap("<leader>fs", "<cmd>Rg<cr>", "Grep")
    nmap("<leader>fm", "<cmd>Marks<cr>", "Marks")
    nmap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "Word")
    nmap("<leader>fr", "<cmd>FzfLua resume<cr>", "Resume")
    nmap("<leader>/", "<cmd>BLines<cr>", "Buffer Lines")
end)

now_if_args(function()
    add { source = "neovim/nvim-lspconfig" }

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local nmap = function(keys, func, desc)
                if desc then desc = "Lsp: " .. desc end
                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
            end

            nmap("grf", function() vim.lsp.buf.format { async = true } end, "Format")
            nmap("grr", "<cmd>FzfLua lsp_references ignore_current_line=true<cr>", "Reference")
            nmap("gd", "<cmd>FzfLua lsp_definitions jump1=true<cr>", "Definition")

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client == nil then return end
            if client.name == "ruff" then
                client.server_capabilities.hoverProvider = false
            end
        end
    })

    local servers = {
        bashls = {},
        clangd = {},
        eslint = {},
        gopls = {},
        lua_ls = {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    telemetry = { enable = false },
                    workspace = {
                        ignoreSubmodule = true,
                        library = { vim.env.VIMRUNTIME, vim.fn.stdpath("data") .. "/site/" }
                    },
                },
            },
        },
        pyright = {
            settings = {
                pyright = { openFilesOnly = true, disableOrganizeImports = true },
                python = { analysis = { ignore = { "*" } } },
            },
        },
        ruff = {},
        rust_analyzer = {},
        ts_ls = {},
    }

    for server, config in pairs(servers) do vim.lsp.config(server, config) end
    vim.lsp.enable(vim.tbl_keys(servers))
end)

now(function()
    add { source = "NeogitOrg/neogit", depends = { "nvim-lua/plenary.nvim" } }

    require("neogit").setup { disable_hint = true }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Git: " .. desc end
        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gg", "<cmd>Neogit<cr>", "Neogit")
end)

now(function()
    add { source = "stevearc/oil.nvim" }

    require("oil").setup {
        default_file_explorer = true,
        watch_for_changes = true,
        columns = { "permissions", "size", "birthtime" },
        view_options = { show_hidden = true, case_insensitive = true },
        keymaps = {
            ["q"] = "actions.close",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-k>"] = false,
            ["<C-j>"] = false,
        },
    }

    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil" })
end)

now_if_args(function()
    add {
        source = "nvim-treesitter/nvim-treesitter",
        depends = { "nvim-treesitter/nvim-treesitter-context" },
        checkout = "main",
        hooks = { post_checkout = function() vim.cmd [[ TSUpdate ]] end },
    }

    require("treesitter-context").setup { multiwindow = true, max_lines = 5 }

    local function is_parser_installed(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) > 0
    end

    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(event)
            local filetype = vim.bo[event.buf].filetype
            if filetype == "" then return end
            local lang = vim.treesitter.language.get_lang(filetype)
            if lang and not is_parser_installed(lang) then require("nvim-treesitter").install({ lang }) end
        end
    })

    vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
            local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
            if lang and is_parser_installed(lang) then vim.treesitter.start(event.buf) end
        end
    })
end)

now(function()
    add { source = "tpope/vim-fugitive" }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Git: " .. desc end
        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>gl", "<cmd>Git log --graph --decorate<cr>", "Log")
    nmap("<leader>gb", "<cmd>Git blame<cr>", "Blame")
    nmap("<leader>gd", "<cmd>Git diff<cr>", "Diff")
    nmap("<leader>gs", "<cmd>Git status<cr>", "Status")
end)

later(function()
    add { source = "christoomey/vim-tmux-navigator" }

    local nmap = function(keymap, command, desc)
        if desc then desc = "Tmux: " .. desc end
        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Left")
    nmap("<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Down")
    nmap("<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Up")
    nmap("<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Right")
    nmap("<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate Previous")
end)
