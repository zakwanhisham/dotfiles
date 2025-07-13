return {
    "github/copilot.vim",
    lazy = false,
    config = function()
        vim.g.copilot_wokspace_folders = { vim.env.HOME .. "Work/landing" }
    end
}
