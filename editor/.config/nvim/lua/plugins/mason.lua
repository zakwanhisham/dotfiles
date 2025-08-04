return {
    "mason-org/mason.nvim",
    event = "LspAttach",
    lazy = false,
    config = function()
        require("mason").setup {}
    end
}
