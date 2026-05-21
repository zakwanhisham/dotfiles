--[[ Options ]]
vim.g.mapleader = " "

vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.completeopt = "menuone,noselect,preview,noinsert,fuzzy"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.wildmode = "longest:full,full"
vim.opt.inccommand = "split"
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 400
vim.opt.colorcolumn = "80"
vim.opt.cursorline = false
vim.opt.scrolloff = 99
vim.opt.sidescrolloff = 12
vim.opt.sidescroll = 0
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 1
vim.opt.conceallevel = 0
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.linebreak = true

--[[ Keymaps ]]
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "x" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "j", "v:count==0 ? 'gj' : 'j'", { expr = true, noremap = true })
vim.keymap.set({ "n", "x" }, "k", "v:count==0 ? 'gk' : 'k'", { expr = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Undotree" })

--[[ Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", callback = function() vim.hl.on_yank {} end })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    callback = function()
        vim.cmd [[
            setlocal nofoldenable wrap nonumber norelativenumber nolist signcolumn=no colorcolumn=81
            wincmd L
            vertical resize 81
        ]]
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fugitiveblame", "git", "help", "qf", "term", "minideps-confirm", "nvim-undotree" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fzf", "git", "gitcommit", "help", "man", "mason", "markdown", "term" },
    callback = function() vim.b.miniindentscope_disable = true end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(event)
        if event.match:match "^%w%w+:[\\/][\\/]" then return end
        ---@diagnostic disable-next-line: undefined-field
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end
})

--[[ MiniDeps ]]
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not (vim.uv or vim.loop).fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

--[[ Colorscheme ]]
now(function()
    add { source = "sainnhe/gruvbox-material" }

    vim.o.background = "dark"

    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_disable_terminal_colors = 1
    vim.g.gruvbox_material_statusline_style = "original"
    vim.g.gruvbox_material_better_performance = 1

    vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
        pattern = 'gruvbox-material',
        callback = function()
            local config = vim.fn['gruvbox_material#get_configuration']()
            local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground,
                config.colors_override)
            local set_hl = vim.fn['gruvbox_material#highlight']
            set_hl('LineNrAbove', palette.grey1, palette.none)
            set_hl('LineNr', palette.yellow, palette.none)
            set_hl('LineNrBelow', palette.grey1, palette.none)
        end
    })

    vim.cmd [[ colorscheme gruvbox-material ]]
end)

--[[ Mini ]]
later(function() require("mini.ai").setup {} end)

later(function()
    local MiniClue = require("mini.clue")
    MiniClue.setup {
        clues = {
            { mode = "n", keys = "<leader>f", desc = "+Fzf" },
            { mode = "n", keys = "<leader>g", desc = "+Git" },
            { mode = "n", keys = "<leader>t", desc = "+Trail" },
            MiniClue.gen_clues.square_brackets(),
            MiniClue.gen_clues.builtin_completion(),
            MiniClue.gen_clues.g(),
            MiniClue.gen_clues.marks(),
            MiniClue.gen_clues.registers(),
            MiniClue.gen_clues.windows(),
            MiniClue.gen_clues.z(),
        },
        triggers = { { mode = 'n', keys = '<Leader>' }, { mode = 'x', keys = '<Leader>' }, { mode = 'n', keys = '[' },
            { mode = 'n', keys = ']' }, { mode = 'i', keys = '<C-x>' }, { mode = 'n', keys = 'g' }, { mode = 'x', keys = 'g' },
            { mode = 'n', keys = "'" }, { mode = 'n', keys = '`' }, { mode = 'x', keys = "'" }, { mode = 'x', keys = '`' },
            { mode = 'n', keys = '"' }, { mode = 'x', keys = '"' }, { mode = 'i', keys = '<C-r>' }, { mode = 'c', keys = '<C-r>' },
            { mode = 'n', keys = '<C-w>' }, { mode = 'n', keys = 'z' }, { mode = 'x', keys = 'z' },
        },
        window = { config = { anchor = "SE", width = "auto", row = "auto", col = "auto" } },
    }
end)

later(function() require("mini.comment").setup { options = { ignore_blank_line = true } } end)

later(function()
    require("mini.diff").setup {
        view = { style = "sign" },
        mappings = { goto_first = '[C', goto_prev = '[c', goto_next = ']c', goto_last = ']C' }
    }
end)

later(function()
    local MiniHipatterns = require("mini.hipatterns")
    MiniHipatterns.setup {
        highlighters = {
            fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
            hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
            todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
            note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
            MiniHipatterns.gen_highlighter.hex_color()
        }
    }
end)

later(function() require("mini.indentscope").setup {} end)

later(function() require("mini.move").setup {} end)

now(function()
    local MiniStatusline = require("mini.statusline")
    MiniStatusline.setup {
        content = {
            active = function()
                vim.cmd [[ hi MiniStatuslineModeNormal cterm=NONE gui=NONE ]]

                local highlight   = "MiniStatuslineModeNormal"
                local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
                local diff        = MiniStatusline.section_diff { trunc_width = 75 }
                local filename    = MiniStatusline.section_filename { trunc_width = 140 }
                local git         = "%{FugitiveStatusline()}"
                local location    = MiniStatusline.section_location { trunc_width = 75 }

                return MiniStatusline.combine_groups {
                    "%<",
                    { hl = highlight, strings = { filename } },
                    { hl = highlight, strings = { diagnostics } },
                    "%=",
                    { hl = highlight, strings = { git } },
                    { hl = highlight, strings = { diff } },
                    { hl = highlight, strings = { location } },
                }
            end,
            inactive = function()
                local highlight = "MiniStatuslineInactive"
                local filename  = MiniStatusline.section_filename { trunc_width = 140 }

                return MiniStatusline.combine_groups { "%<", { hl = highlight, strings = { filename } } }
            end,
        },
        use_icons = false,
    }
end)

later(function() require("mini.surround").setup {} end)

later(function()
    local MiniTrailspace = require("mini.trailspace")
    MiniTrailspace.setup {}

    local nmap = function(keymap, command, desc)
        if desc then desc = "Trail: " .. desc end
        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<leader>tw", function() MiniTrailspace.trim() end, "Whitespace")
    nmap("<leader>tl", function() MiniTrailspace.trim_last_lines() end, "Last lines")
end)

--[[ Plugins ]]
later(function()
    add { source = "saghen/blink.cmp", depends = { "saghen/blink.lib", "rafamadriz/friendly-snippets" } }

    local cmp = require("blink.cmp")

    cmp.build():wait(60000)

    cmp.setup {
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
    add { source = "neovim/nvim-lspconfig", depends = { "j-hui/fidget.nvim" } }

    require("fidget").setup {}

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
            if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
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
                    workspace = { ignoreSubmodule = true, library = { vim.env.VIMRUNTIME, vim.fn.stdpath("data") .. "/site/" } },
                },
            },
        },
        pyright = {
            settings = {
                pyright = { openFilesOnly = true, disableOrganizeImports = true }, python = { analysis = { ignore = { "*" } } },
            },
        },
        ruff = {},
        rust_analyzer = {},
        ts_ls = {},
    }

    for server, config in pairs(servers) do vim.lsp.config[server] = config end
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
        keymaps = { ["q"] = "actions.close", ["<C-h>"] = false, ["<C-l>"] = false, ["<C-k>"] = false, ["<C-j>"] = false },
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

    local languages = require('nvim-treesitter').get_available()
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd("FileType",
        { pattern = languages, callback = function(ev) vim.treesitter.start(ev.buf) end })
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
