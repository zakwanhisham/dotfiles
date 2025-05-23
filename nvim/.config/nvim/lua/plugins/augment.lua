return {
    "augmentcode/augment.vim",
    lazy   = false,
    cmd    = "Augment",
    keys   = {
        { "<leader>ac", "<cmd>Augment chat<cr>",        desc = "Augment Chat" },
        { "<leader>at", "<cmd>Augment chat-toggle<cr>", desc = "Augment Chat Toggle" },
        { "<leader>an", "<cmd>Augment chat-new<cr>",    desc = "Augment Chat New" },
    },
    config = function()
        vim.g.augment_workspace_folders = { os.getenv("HOME") .. "/Work/landing/" }
    end
}
