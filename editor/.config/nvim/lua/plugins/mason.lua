local add, now = MiniDeps.add, MiniDeps.now

add { source = "mason-org/mason.nvim" }

now(function()
    require("mason").setup {}
end)
