local add, later = MiniDeps.add, MiniDeps.later

add { source = "Bekaboo/dropbar.nvim" }

later(function()
    require("dropbar").setup {}
end)
