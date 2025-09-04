local add, now = MiniDeps.add, MiniDeps.now

add { source = "awslabs/amazonq.nvim" }

now(function()
    require("amazonq").setup { ssoStartUrl = "https://view.awsapps.com/start" }
end)
