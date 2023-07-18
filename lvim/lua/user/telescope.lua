lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
lvim.keys.normal_mode["gr"] = "<cmd>Telescope lsp_references show_line=false<CR>"

local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope = {
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			height = 0.8, -- adjust the height of the results window
			width = 0.8, -- adjust the width of the results window

			-- Adjust the following options as needed:
			preview_cutoff = 120, -- Maximum number of characters to display in the preview column
			-- results_width = 0.6,
			horizontal = {
				preview_width = 0.5, -- Adjust the width of the preview column
			},
		},
		mappings = {
			-- for input mode
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
			},
			-- for normal mode
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
}
