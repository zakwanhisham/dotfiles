return {
    "augmentcode/augment.vim",
    lazy = false,
    cmd = "Augment",
    config = function()
        vim.g.augment_workspace_folders = { os.getenv("HOME") .. "/Work/landing/" }
    end
}
