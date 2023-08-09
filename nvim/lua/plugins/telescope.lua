-- Telescope fuzzy finding
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "Bufenter",
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					path_display = { "smart" },
					file_ignore_patterns = { ".git/", "node_modules" },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "projects")

			local map = require("helpers.keys").map
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")
			map("n", "<leader>fr", builtin.oldfiles, "Recently Opened")
			map("n", "<leader>fb", builtin.buffers, "Open Buffers")
			map("n", "<leader>fs", function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({
					winblend = 10,
					previewer = true,
				}))
			end, "Search in current buffer")
			map("n", "<leader>fp", ":Telescope projects<CR>", "Open Projects")

			map("n", "<leader>sf", builtin.find_files, "Files")
			map("n", "<leader>sh", builtin.help_tags, "Help")
			map("n", "<leader>sw", builtin.grep_string, "Current Word")
			map("n", "<leader>sg", builtin.live_grep, "Grep")
			map("n", "<leader>sd", builtin.diagnostics, "Diagnostics")
		end,
	},
}
