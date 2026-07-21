vim.g.mapleader = " "
vim.opt.background = "dark"
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.completeopt = "menuone,noselect,preview,noinsert,fuzzy"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.termguicolors = true
vim.opt.wildmode = "longest:full,full"
vim.opt.inccommand = "split"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"

local function nmap(keys, func, desc) vim.keymap.set("n", keys, func, { desc = desc }) end

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
nmap("<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, "Undotree")
nmap("-", "<cmd>Oil<cr>", "Oil")
nmap("<leader>tw", function() MiniTrailspace.trim() end, "Whitespace")
nmap("<leader>tl", function() MiniTrailspace.trim_last_lines() end, "Last lines")
nmap("<leader><space>", "<cmd>Buffers<cr>", "Buffers")
nmap("<leader>ff", "<cmd>Files<cr>", "Files")
nmap("<leader>fs", "<cmd>Rg<cr>", "Grep")
nmap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "Word")
nmap("<leader>fr", "<cmd>FzfLua resume<cr>", "Resume")
nmap("<leader>/", "<cmd>BLines<cr>", "Search")
nmap("<leader>gg", "<cmd>Neogit<cr>", "Neogit")
nmap("<leader>gl", "<cmd>Git log --graph --decorate<cr>", "Log")
nmap("<leader>gb", "<cmd>Git blame<cr>", "Blame")
nmap("<leader>gd", "<cmd>Git diff<cr>", "Diff")
nmap("<leader>gs", "<cmd>Git status<cr>", "Status")
nmap("<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Left")
nmap("<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Down")
nmap("<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Up")
nmap("<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Right")
nmap("<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate Previous")

vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", callback = function() vim.hl.on_yank {} end })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "fugitiveblame", "git", "help", "qf", "term", "nvim-undotree", "nvim-pack" },
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
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd("TSUpdate")
        end
    end
})

vim.pack.add({
    { src = "https://github.com/saghen/blink.lib" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/morhetz/gruvbox" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = "main" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

local misc = require("mini.misc")
local now = function(f) misc.safely("now", f) end
local later = function(f) misc.safely("later", f) end
local now_if_args = vim.fn.argc(-1) > 0 and now or later

now(function()
    vim.g.gruvbox_bold = 0
    vim.g.gruvbox_italic = 0
    vim.g.gruvbox_underline = 0
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_hls_cursor = "red"
    vim.g.gruvbox_sign_column = "bg0"
    vim.g.gruvbox_italicize_comments = 0
    vim.g.gruvbox_invert_selection = 0

    vim.cmd.colorscheme("gruvbox")

    require("oil").setup {
        default_file_explorer = true, watch_for_changes = true, columns = { "permissions", "size", "birthtime" },
        view_options = { show_hidden = true, case_insensitive = true },
        keymaps = { ["q"] = "actions.close", ["<C-h>"] = false, ["<C-l>"] = false, ["<C-k>"] = false, ["<C-j>"] = false },
    }
end)

now_if_args(function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local bufmap = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "Lsp: " .. desc })
            end

            bufmap("grf", function() vim.lsp.buf.format { async = true } end, "Format")
            bufmap("grr", "<cmd>FzfLua lsp_references ignore_current_line=true<cr>", "Reference")
            bufmap("gd", "<cmd>FzfLua lsp_definitions jump1=true<cr>", "Go to Definition")

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.name == "ruff" then client.server_capabilities.hoverProvider = false end
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
                    runtime = { version = "LuaJIT" },
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

    require("treesitter-context").setup { multiwindow = true, max_lines = 5 }

    local languages = require("nvim-treesitter").get_available()
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType",
        { pattern = languages, callback = function(ev) vim.treesitter.start(ev.buf) end })
end)

later(function()
    require("mini.ai").setup {}
    require("mini.move").setup {}
    require("mini.surround").setup {}
    require("mini.indentscope").setup {}
    require("mini.diff").setup { view = { style = "sign" }, mappings = { goto_first = "[C", goto_prev = "[c", goto_next = "]c", goto_last = "]C" } }

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
        triggers = { { mode = "n", keys = "<Leader>" }, { mode = "x", keys = "<Leader>" }, { mode = "n", keys = "[" },
            { mode = "n", keys = "]" }, { mode = "i", keys = "<C-x>" }, { mode = "n", keys = "g" }, { mode = "x", keys = "g" },
            { mode = "n", keys = "'" }, { mode = "n", keys = "`" }, { mode = "x", keys = "'" }, { mode = "x", keys = "`" },
            { mode = "n", keys = '"' }, { mode = "x", keys = '"' }, { mode = "i", keys = "<C-r>" }, { mode = "c", keys = "<C-r>" },
            { mode = "n", keys = "<C-w>" }, { mode = "n", keys = "z" }, { mode = "x", keys = "z" },
        },
        window = { config = { anchor = "SE", width = "auto", row = "auto", col = "auto" } },
    }

    local MiniHipatterns = require("mini.hipatterns")
    MiniHipatterns.setup { highlighters = { MiniHipatterns.gen_highlighter.hex_color() } }

    local MiniStatusline = require("mini.statusline")
    MiniStatusline.setup {
        content = {
            active = function()
                return MiniStatusline.combine_groups {
                    "%<",
                    { hl = "MiniStatuslineModeNormal", strings = { MiniStatusline.section_filename { trunc_width = 140 } } },
                    { hl = "MiniStatuslineModeNormal", strings = { MiniStatusline.section_diagnostics { trunc_width = 75 } } },
                    "%=",
                    { hl = "MiniStatuslineModeNormal", strings = { "%{FugitiveStatusline()}" } },
                    { hl = "MiniStatuslineModeNormal", strings = { MiniStatusline.section_diff { trunc_width = 75 } } },
                    { hl = "MiniStatuslineModeNormal", strings = { MiniStatusline.section_location { trunc_width = 75 } } },
                }
            end,
            inactive = function()
                return MiniStatusline.combine_groups {
                    "%<", { hl = "MiniStatuslineInactive", strings = { MiniStatusline.section_filename { trunc_width = 140 } } },
                }
            end,
        },
        use_icons = false,
    }

    local MiniTrailspace = require("mini.trailspace")
    MiniTrailspace.setup {}

    local cmp = require("blink.cmp")
    cmp.build():pwait()
    cmp.setup {
        keymap = { preset = "enter" },
        cmdline = { enabled = true, keymap = { preset = "inherit" } },
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

    require("fzf-lua").setup {
        { "fzf-vim", "hide" },
        winopts = { height = 0.4, width = 1, row = 1, border = "border-top", backdrop = 100 },
        keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
    }

    require("neogit").setup { disable_hint = true }
end)
