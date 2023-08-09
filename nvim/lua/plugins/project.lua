return {
    {
        "ahmedkhalf/project.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                event = "Bufenter",
                cmd = { "Telescope" },
            },
        },

        config = function()
            local project = require("project_nvim")
            project.setup {
                detection_methods = { "pattern" },
                patterns = { ".git", "Makefile", "package.json" },
            }

            require("telescope").load_extension("projects")
        end
    },
}
