local add, now = MiniDeps.add, MiniDeps.now

add { source = "awslabs/amazonq.nvim" }

now(function()
    require("amazonq").setup {
        ssoStartUrl = "https://view.awsapps.com/start",
        inline_suggest = false,
        on_chat_open = function()
            vim.cmd [[
                vertical botright split
                vertical resize 80
                set wrap breakindent nonumber norelativenumber nolist signcolumn=no
            ]]
        end
    }
end)
