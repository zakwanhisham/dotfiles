return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "supermaven-inc/supermaven-nvim",
            config = function()
                require("supermaven-nvim").setup {}
            end,
        },
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                if vim.fn.executable "make" == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
            dependencies = {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
        },
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert,noselect,preview" },

            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ["<TAB>"] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-TAB>"] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = {
                {
                    name = "lazydev",
                    -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                    group_index = 0,
                },
                { name = "nvim_lsp" },
                { name = "supermaven" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            enabled = function()
                -- disable completion in comments
                local context = require "cmp.config.context"
                -- keep command mode completion enabled when cursor is in a comment
                if vim.api.nvim_get_mode().mode == "c" then
                    return true
                elseif vim.bo.buftype == "prompt" then
                    return false
                else
                    return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
                end
            end,
        }
    end,
}
