local add, later = MiniDeps.add, MiniDeps.later

add { source = "mason-org/mason.nvim" }

later(function()
    require("mason").setup {}
end)
