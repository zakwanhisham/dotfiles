return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undotree" },
    },
    opts = {},
}
