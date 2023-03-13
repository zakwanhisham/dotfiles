---@diagnostic disable
version = "0.20.2"
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable
xplr.config.general.disable_debug_error_mode = false
xplr.config.general.enable_mouse = true
xplr.config.general.show_hidden = true
xplr.config.general.read_only = false
xplr.config.general.enable_recover_mode = false
xplr.config.general.hide_remaps_in_help_menu = false
xplr.config.general.enforce_bounded_index_navigation = false
xplr.config.general.prompt.format = "❯ "
xplr.config.general.prompt.style = {}
xplr.config.general.logs.info.format = "INFO"
xplr.config.general.logs.info.style = { fg = "LightBlue" }
xplr.config.general.logs.success.format = "SUCCESS"
xplr.config.general.logs.success.style = { fg = "Green" }
xplr.config.general.logs.warning.format = "WARNING"
xplr.config.general.logs.warning.style = { fg = "Yellow" }
xplr.config.general.logs.error.format = "ERROR"
xplr.config.general.logs.error.style = { fg = "Red" }
xplr.config.general.table.header.cols = {
	{ format = " index", style = {} },
	{ format = "╭─── path", style = {} },
	{ format = "permissions", style = {} },
	{ format = "size", style = {} },
	{ format = "modified", style = {} },
}
xplr.config.general.table.header.style = {}
xplr.config.general.table.header.height = 1
xplr.config.general.table.row.cols = {
	{
		format = "builtin.fmt_general_table_row_cols_0",
		style = {},
	},
	{
		format = "builtin.fmt_general_table_row_cols_1",
		style = {},
	},
	{
		format = "builtin.fmt_general_table_row_cols_2",
		style = {},
	},
	{
		format = "builtin.fmt_general_table_row_cols_3",
		style = {},
	},
	{
		format = "builtin.fmt_general_table_row_cols_4",
		style = {},
	},
}
xplr.config.general.table.row.style = {}
xplr.config.general.table.row.height = 0
xplr.config.general.table.style = {}
xplr.config.general.table.tree = {
	{ format = "├", style = {} },
	{ format = "├", style = {} },
	{ format = "╰", style = {} },
}
xplr.config.general.table.col_spacing = 1
xplr.config.general.table.col_widths = {
	{ Percentage = 10 },
	{ Percentage = 50 },
	{ Percentage = 10 },
	{ Percentage = 10 },
	{ Percentage = 20 },
}
xplr.config.general.default_ui.prefix = "  "
xplr.config.general.default_ui.suffix = ""
xplr.config.general.default_ui.style = {}
xplr.config.general.focus_ui.prefix = "▸["
xplr.config.general.focus_ui.suffix = "]"
xplr.config.general.focus_ui.style = { add_modifiers = { "Bold" } }
xplr.config.general.selection_ui.prefix = " {"
xplr.config.general.selection_ui.suffix = "}"
xplr.config.general.selection_ui.style = {
	fg = "DarkGray",
	add_modifiers = { "CrossedOut" },
}
xplr.config.general.focus_selection_ui.prefix = "▸["
xplr.config.general.focus_selection_ui.suffix = "]"
xplr.config.general.focus_selection_ui.style = {
	add_modifiers = { "Bold", "CrossedOut" },
}
xplr.config.general.sort_and_filter_ui.separator.format = " › "
xplr.config.general.sort_and_filter_ui.separator.style = {
	add_modifiers = { "Dim" },
}
xplr.config.general.sort_and_filter_ui.default_identifier.format = nil
xplr.config.general.sort_and_filter_ui.default_identifier.style = {}
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.format = "↓"
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.style = nil
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.format = "↑"
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.style = nil
xplr.config.general.sort_and_filter_ui.sorter_identifiers = {
	ByExtension = { format = "ext", style = {} },
	ByICanonicalAbsolutePath = { format = "[ci]abs", style = {} },
	ByIRelativePath = { format = "[i]rel", style = {} },
	ByISymlinkAbsolutePath = { format = "[si]abs", style = {} },
	ByIsBroken = { format = "⨯", style = {} },
	ByIsDir = { format = "dir", style = {} },
	ByIsFile = { format = "file", style = {} },
	ByIsReadonly = { format = "ro", style = {} },
	ByIsSymlink = { format = "sym", style = {} },
	ByMimeEssence = { format = "mime", style = {} },
	ByRelativePath = { format = "rel", style = {} },
	BySize = { format = "size", style = {} },
	ByCreated = { format = "created", style = {} },
	ByLastModified = { format = "modified", style = {} },
	ByCanonicalAbsolutePath = { format = "[c]abs", style = {} },
	ByCanonicalExtension = { format = "[c]ext", style = {} },
	ByCanonicalIsDir = { format = "[c]dir", style = {} },
	ByCanonicalIsFile = { format = "[c]file", style = {} },
	ByCanonicalIsReadonly = { format = "[c]ro", style = {} },
	ByCanonicalMimeEssence = { format = "[c]mime", style = {} },
	ByCanonicalSize = { format = "[c]size", style = {} },
	ByCanonicalCreated = { format = "[c]created", style = {} },
	ByCanonicalLastModified = { format = "[c]modified", style = {} },
	BySymlinkAbsolutePath = { format = "[s]abs", style = {} },
	BySymlinkExtension = { format = "[s]ext", style = {} },
	BySymlinkIsDir = { format = "[s]dir", style = {} },
	BySymlinkIsFile = { format = "[s]file", style = {} },
	BySymlinkIsReadonly = { format = "[s]ro", style = {} },
	BySymlinkMimeEssence = { format = "[s]mime", style = {} },
	BySymlinkSize = { format = "[s]size", style = {} },
	BySymlinkCreated = { format = "[s]created", style = {} },
	BySymlinkLastModified = { format = "[s]modified", style = {} },
}
xplr.config.general.sort_and_filter_ui.filter_identifiers = {
	RelativePathDoesContain = { format = "rel=~", style = {} },
	RelativePathDoesEndWith = { format = "rel=$", style = {} },
	RelativePathDoesNotContain = { format = "rel!~", style = {} },
	RelativePathDoesNotEndWith = { format = "rel!$", style = {} },
	RelativePathDoesNotStartWith = { format = "rel!^", style = {} },
	RelativePathDoesStartWith = { format = "rel=^", style = {} },
	RelativePathIs = { format = "rel==", style = {} },
	RelativePathIsNot = { format = "rel!=", style = {} },
	RelativePathDoesMatchRegex = { format = "rel=/", style = {} },
	RelativePathDoesNotMatchRegex = { format = "rel!/", style = {} },

	IRelativePathDoesContain = { format = "[i]rel=~", style = {} },
	IRelativePathDoesEndWith = { format = "[i]rel=$", style = {} },
	IRelativePathDoesNotContain = { format = "[i]rel!~", style = {} },
	IRelativePathDoesNotEndWith = { format = "[i]rel!$", style = {} },
	IRelativePathDoesNotStartWith = { format = "[i]rel!^", style = {} },
	IRelativePathDoesStartWith = { format = "[i]rel=^", style = {} },
	IRelativePathIs = { format = "[i]rel==", style = {} },
	IRelativePathIsNot = { format = "[i]rel!=", style = {} },
	IRelativePathDoesMatchRegex = { format = "[i]rel=/", style = {} },
	IRelativePathDoesNotMatchRegex = { format = "[i]rel!/", style = {} },

	AbsolutePathDoesContain = { format = "abs=~", style = {} },
	AbsolutePathDoesEndWith = { format = "abs=$", style = {} },
	AbsolutePathDoesNotContain = { format = "abs!~", style = {} },
	AbsolutePathDoesNotEndWith = { format = "abs!$", style = {} },
	AbsolutePathDoesNotStartWith = { format = "abs!^", style = {} },
	AbsolutePathDoesStartWith = { format = "abs=^", style = {} },
	AbsolutePathIs = { format = "abs==", style = {} },
	AbsolutePathIsNot = { format = "abs!=", style = {} },
	AbsolutePathDoesMatchRegex = { format = "abs=/", style = {} },
	AbsolutePathDoesNotMatchRegex = { format = "abs!/", style = {} },

	IAbsolutePathDoesContain = { format = "[i]abs=~", style = {} },
	IAbsolutePathDoesEndWith = { format = "[i]abs=$", style = {} },
	IAbsolutePathDoesNotContain = { format = "[i]abs!~", style = {} },
	IAbsolutePathDoesNotEndWith = { format = "[i]abs!$", style = {} },
	IAbsolutePathDoesNotStartWith = { format = "[i]abs!^", style = {} },
	IAbsolutePathDoesStartWith = { format = "[i]abs=^", style = {} },
	IAbsolutePathIs = { format = "[i]abs==", style = {} },
	IAbsolutePathIsNot = { format = "[i]abs!=", style = {} },
	IAbsolutePathDoesMatchRegex = { format = "[i]abs=/", style = {} },
	IAbsolutePathDoesNotMatchRegex = { format = "[i]abs!/", style = {} },
}
xplr.config.general.sort_and_filter_ui.search_identifier = {
	format = "search:",
	style = {},
}
xplr.config.general.panel_ui.default.title.format = nil
xplr.config.general.panel_ui.default.title.style = {
	fg = "Reset",
	add_modifiers = { "Bold" },
}
xplr.config.general.panel_ui.default.style = {}
xplr.config.general.panel_ui.default.borders = {
	"Top",
	"Right",
	"Bottom",
	"Left",
}
xplr.config.general.panel_ui.default.border_type = "Rounded"
xplr.config.general.panel_ui.default.border_style = { fg = "DarkGray" }
xplr.config.general.panel_ui.table.title.format = nil
xplr.config.general.panel_ui.table.title.style = {}
xplr.config.general.panel_ui.table.style = {}
xplr.config.general.panel_ui.table.borders = nil
xplr.config.general.panel_ui.table.border_type = nil
xplr.config.general.panel_ui.table.border_style = {}
xplr.config.general.panel_ui.help_menu.title.format = nil
xplr.config.general.panel_ui.help_menu.title.style = {}
xplr.config.general.panel_ui.help_menu.style = {}
xplr.config.general.panel_ui.help_menu.borders = nil
xplr.config.general.panel_ui.help_menu.border_type = nil
xplr.config.general.panel_ui.help_menu.border_style = {}
xplr.config.general.panel_ui.input_and_logs.title.format = nil
xplr.config.general.panel_ui.input_and_logs.title.style = {}
xplr.config.general.panel_ui.input_and_logs.style = {}
xplr.config.general.panel_ui.input_and_logs.borders = nil
xplr.config.general.panel_ui.input_and_logs.border_type = nil
xplr.config.general.panel_ui.input_and_logs.border_style = {}
xplr.config.general.panel_ui.selection.title.format = nil
xplr.config.general.panel_ui.selection.title.style = {}
xplr.config.general.panel_ui.selection.style = {}
xplr.config.general.panel_ui.selection.border_type = nil
xplr.config.general.panel_ui.selection.border_style = {}
xplr.config.general.panel_ui.sort_and_filter.title.format = nil
xplr.config.general.panel_ui.sort_and_filter.title.style = {}
xplr.config.general.panel_ui.sort_and_filter.style = {}
xplr.config.general.panel_ui.sort_and_filter.borders = nil
xplr.config.general.panel_ui.sort_and_filter.border_type = nil
xplr.config.general.panel_ui.sort_and_filter.border_style = {}
xplr.config.general.initial_sorting = {
	{ sorter = "ByCanonicalIsDir", reverse = true },
	{ sorter = "ByIRelativePath", reverse = false },
}
xplr.config.general.initial_mode = "default"
xplr.config.general.initial_layout = "default"
xplr.config.general.start_fifo = nil
xplr.config.general.global_key_bindings = {
	on_key = {
		["esc"] = {
			messages = {
				"PopMode",
			},
		},
		["ctrl-c"] = {
			messages = {
				"Terminate",
			},
		},
	},
}
xplr.config.node_types.directory.style = {
	fg = "Cyan",
}
xplr.config.node_types.directory.meta.icon = "ð"
xplr.config.node_types.file.style = {}
xplr.config.node_types.file.meta.icon = "ƒ"
xplr.config.node_types.symlink.style = {
	fg = "Magenta",
	add_modifiers = { "Italic" },
}
xplr.config.node_types.symlink.meta.icon = "§"
xplr.config.node_types.mime_essence = {}
xplr.config.node_types.extension = {}
xplr.config.node_types.special = {}
xplr.config.layouts.builtin.default = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			{
				Vertical = {
					config = {
						constraints = {
							{ Percentage = 30 },
							{ Percentage = 70 },
						},
					},
					splits = {
						"Selection",
						"HelpMenu",
					},
				},
			},
		},
	},
}
xplr.config.layouts.builtin.no_help = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			"Selection",
		},
	},
}
xplr.config.layouts.builtin.no_selection = {
	Horizontal = {
		config = {
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						constraints = {
							{ Length = 3 },
							{ Min = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"SortAndFilter",
						"Table",
						"InputAndLogs",
					},
				},
			},
			"HelpMenu",
		},
	},
}
xplr.config.layouts.builtin.no_help_no_selection = {
	Vertical = {
		config = {
			constraints = {
				{ Length = 3 },
				{ Min = 1 },
				{ Length = 3 },
			},
		},
		splits = {
			"SortAndFilter",
			"Table",
			"InputAndLogs",
		},
	},
}
xplr.config.layouts.custom = {}
xplr.config.modes.builtin.default = {
	name = "default",
	key_bindings = {
		on_key = {
			["#"] = {
				messages = {
					"PrintAppStateAndQuit",
				},
			},
			["."] = {
				help = "show hidden",
				messages = {
					{
						ToggleNodeFilter = { filter = "RelativePathDoesNotStartWith", input = "." },
					},
					"ExplorePwdAsync",
				},
			},
			[":"] = {
				help = "action",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "action" },
				},
			},
			["?"] = {
				help = "global help menu",
				messages = {
					{
						BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_GLOBAL_HELP_MENU_OUT}" | ${PAGER:?}
            ]===],
					},
				},
			},
			["G"] = {
				help = "go to bottom",
				messages = {
					"PopMode",
					"FocusLast",
				},
			},
			["ctrl-a"] = {
				help = "select/unselect all",
				messages = {
					"ToggleSelectAll",
				},
			},
			["ctrl-f"] = {
				help = "search",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "search" },
					{ SetInputBuffer = "" },
				},
			},
			["ctrl-i"] = {
				help = "next visited path",
				messages = {
					"NextVisitedPath",
				},
			},
			["ctrl-o"] = {
				help = "last visited path",
				messages = {
					"LastVisitedPath",
				},
			},
			["ctrl-r"] = {
				help = "refresh screen",
				messages = {
					"ClearScreen",
				},
			},
			["ctrl-u"] = {
				help = "clear selection",
				messages = {
					"ClearSelection",
				},
			},
			["ctrl-w"] = {
				help = "switch layout",
				messages = {
					{ SwitchModeBuiltin = "switch_layout" },
				},
			},
			["d"] = {
				help = "delete",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "delete" },
				},
			},
			["down"] = {
				help = "down",
				messages = {
					"FocusNext",
				},
			},
			["enter"] = {
				help = "quit with result",
				messages = {
					"PrintResultAndQuit",
				},
			},
			["f"] = {
				help = "filter",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "filter" },
				},
			},
			["g"] = {
				help = "go to",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "go_to" },
				},
			},
			["left"] = {
				help = "back",
				messages = {
					"Back",
				},
			},
			["q"] = {
				help = "quit",
				messages = {
					"Quit",
				},
			},
			["r"] = {
				help = "rename",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "rename" },
					{
						BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
					},
				},
			},
			["ctrl-d"] = {
				help = "duplicate as",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "duplicate_as" },
					{
						BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
					},
				},
			},
			["right"] = {
				help = "enter",
				messages = {
					"Enter",
				},
			},
			["s"] = {
				help = "sort",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "sort" },
				},
			},
			["space"] = {
				help = "toggle selection",
				messages = {
					"ToggleSelection",
					"FocusNext",
				},
			},
			["up"] = {
				help = "up",
				messages = {
					"FocusPrevious",
				},
			},
			["~"] = {
				help = "go home",
				messages = {
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
					},
				},
			},
			["page-up"] = {
				help = "scroll up",
				messages = {
					"ScrollUp",
				},
			},
			["page-down"] = {
				help = "scroll down",
				messages = {
					"ScrollDown",
				},
			},
			["{"] = {
				help = "scroll up half",
				messages = {
					"ScrollUpHalf",
				},
			},
			["}"] = {
				help = "scroll down half",
				messages = {
					"ScrollDownHalf",
				},
			},
		},
		on_number = {
			help = "input",
			messages = {
				"PopMode",
				{ SwitchModeBuiltin = "number" },
				"BufferInputFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"]
xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["space"]
xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]
xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]
xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["down"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] = xplr.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
	xplr.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.debug_error = {
	name = "debug error",
	layout = {
		Vertical = {
			config = {
				constraints = {
					{ Min = 14 },
					{ MinLessThanScreenHeight = 14 },
				},
			},
			splits = {
				{
					CustomContent = {
						title = "debug error",
						body = {
							StaticParagraph = {
								render = [[
  Some errors occurred during startup.
  If you think this is a bug, please report it at:

  https://github.com/sayanarijit/xplr/issues/new

  Press `enter` to open the logs in your $EDITOR.
  Press `escape` to ignore the errors and continue with the default config.

  To disable this mode, set `xplr.config.general.disable_debug_error_mode`
  to `true` in your config file.
                ]],
							},
						},
					},
				},
				"InputAndLogs",
			},
		},
	},
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "open logs in editor",
				messages = {
					{
						BashExec = [===[
              cat "${XPLR_PIPE_LOGS_OUT:?}" | ${EDITOR:-vi} -
            ]===],
					},
				},
			},
			["q"] = {
				help = "quit",
				messages = {
					"Quit",
				},
			},
		},
		default = {
			messages = {},
		},
	},
}
xplr.config.modes.builtin.recover = {
	name = "recover",
	layout = {
		CustomContent = {
			title = " recover ",
			body = {
				StaticParagraph = {
					render = [[
  You pressed an invalid key and went into "recover" mode.
  This mode saves you from performing unwanted actions.

  Let's calm down, press `escape`, and try again.

  To disable this mode, set `xplr.config.general.enable_recover_mode`
  to `false` in your config file.
          ]],
				},
			},
		},
	},
	key_bindings = {
		default = {
			messages = {},
		},
	},
}
xplr.config.modes.builtin.go_to_path = {
	name = "go to path",
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              PTH=${XPLR_INPUT_BUFFER}
              PTH_ESC=$(printf %q "$PTH")
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              elif [ -e "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m 'LogError: %q' "could not find $PTH_ESC"
              fi
            ]===],
					},
					"PopMode",
				},
			},
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.selection_ops = {
	name = "selection ops",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["c"] = {
				help = "copy here",
				messages = {
					{
						BashExec0 = [===[
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if cp -vr -- "${PTH:?}" ./; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC copied to ."
                else
                  "$XPLR" -m 'LogError: %q' "Failed to copy $PTH_ESC to ."
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              "$XPLR" -m ExplorePwdAsync
              "$XPLR" -m ClearSelection
              read -p "[enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["m"] = {
				help = "move here",
				messages = {
					{
						BashExec0 = [===[
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if mv -v -- "${PTH:?}" ./; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC moved to ."
                else
                  "$XPLR" -m 'LogError: %q' "Failed to move $PTH_ESC to ."
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              "$XPLR" -m ExplorePwdAsync
              read -p "[enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["u"] = {
				help = "clear selection",
				messages = {
					"ClearSelection",
					"PopMode",
				},
			},
		},
	},
}
xplr.config.modes.builtin.create = {
	name = "create",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["d"] = {
				help = "create directory",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_directory" },
					{ SetInputBuffer = "" },
				},
			},
			["f"] = {
				help = "create file",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create_file" },
					{ SetInputBuffer = "" },
				},
			},
		},
	},
}
xplr.config.modes.builtin.create_directory = {
	name = "create directory",
	prompt = "ð ❯ ",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m ExplorePwd \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
					},
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.create_file = {
	name = "create file",
	prompt = "ƒ ❯ ",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$(dirname $(realpath -m $PTH))" \
                && touch -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'ExplorePwd' \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
					},
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.number = {
	name = "number",
	prompt = ":",
	key_bindings = {
		on_key = {
			["down"] = {
				help = "to down",
				messages = {
					"FocusNextByRelativeIndexFromInput",
					"PopMode",
				},
			},
			["enter"] = {
				help = "to index",
				messages = {
					"FocusByIndexFromInput",
					"PopMode",
				},
			},
			["up"] = {
				help = "to up",
				messages = {
					"FocusPreviousByRelativeIndexFromInput",
					"PopMode",
				},
			},
		},
		on_navigation = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
		on_number = {
			help = "input",
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.number.key_bindings.on_key["j"] = xplr.config.modes.builtin.number.key_bindings.on_key["down"]
xplr.config.modes.builtin.number.key_bindings.on_key["k"] = xplr.config.modes.builtin.number.key_bindings.on_key["up"]
xplr.config.modes.builtin.go_to = {
	name = "go to",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["f"] = {
				help = "follow symlink",
				messages = {
					"FollowSymlink",
					"PopMode",
				},
			},
			["g"] = {
				help = "top",
				messages = {
					"FocusFirst",
					"PopMode",
				},
			},
			["p"] = {
				help = "path",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "go_to_path" },
					{ SetInputBuffer = "" },
				},
			},
			["i"] = {
				help = "initial $PWD",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${XPLR_INITIAL_PWD:?}"
            ]===],
					},
				},
			},
			["x"] = {
				help = "open in gui",
				messages = {
					{
						BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                elif command -v open; then
                  OPENER=open
                else
                  "$XPLR" -m 'LogError: "$OPENER not found"'
                  exit 1
                fi
              fi
              (while IFS= read -r -d '' PTH; do
                $OPENER "${PTH:?}" > /dev/null 2>&1
              done < "${XPLR_PIPE_RESULT_OUT:?}")
            ]===],
					},
					"ClearScreen",
					"PopMode",
				},
			},
		},
	},
}
xplr.config.modes.builtin.rename = {
	name = "rename",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                mv -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC renamed to $TARGET_ESC"
              fi
            ]===],
					},
					"PopMode",
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.duplicate_as = {
	name = "duplicate as",
	key_bindings = {
		on_key = {
			["tab"] = {
				help = "try complete",
				messages = {
					{ CallLuaSilently = "builtin.try_complete_path" },
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					{
						BashExecSilently0 = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                cp -r -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET_ESC" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC duplicated as $TARGET_ESC"
              fi
            ]===],
					},
					"PopMode",
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.delete = {
	name = "delete",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["D"] = {
				help = "force delete",
				messages = {
					{
						BashExec0 = [===[
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if rm -rfv -- "${PTH:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                else
                  "$XPLR" -m 'LogError: %q' "Failed to delete $PTH_ESC"
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              "$XPLR" -m ExplorePwdAsync
              read -p "[enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
			["d"] = {
				help = "delete",
				messages = {
					{
						BashExec0 = [===[
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if [ -d "$PTH" ] && [ ! -L "$PTH" ]; then
                  if rmdir -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "Failed to delete $PTH_ESC"
                  fi
                else
                  if rm -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "Failed to delete $PTH_ESC"
                  fi
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              "$XPLR" -m ExplorePwdAsync
              read -p "[enter to continue]"
            ]===],
					},
					"PopMode",
				},
			},
		},
	},
}
xplr.config.modes.builtin.action = {
	name = "action to",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["!"] = {
				help = "shell",
				messages = {
					"PopMode",
					{ Call0 = { command = os.getenv("SHELL") or "bash", args = { "-i" } } },
					"ExplorePwdAsync",
				},
			},
			["c"] = {
				help = "create",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "create" },
				},
			},
			["e"] = {
				help = "open in editor",
				messages = {
					{
						BashExec0 = [===[
              ${EDITOR:-vi} "${XPLR_FOCUS_PATH:?}"
            ]===],
					},
					"PopMode",
				},
			},
			["l"] = {
				help = "logs",
				messages = {
					{
						BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_LOGS_OUT}" | ${PAGER:?}
            ]===],
					},
					"PopMode",
				},
			},
			["s"] = {
				help = "selection operations",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "selection_ops" },
				},
			},
			["m"] = {
				help = "toggle mouse",
				messages = {
					"PopMode",
					"ToggleMouse",
				},
			},
			["v"] = {
				help = "vroot",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "vroot" },
				},
			},
			["q"] = {
				help = "quit options",
				messages = {
					"PopMode",
					{ SwitchModeBuiltin = "quit" },
				},
			},
		},
		on_number = {
			help = "go to index",
			messages = {
				"PopMode",
				{ SwitchModeBuiltin = "number" },
				"BufferInputFromKey",
			},
		},
	},
}
xplr.config.modes.builtin.quit = {
	name = "quit",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "just quit",
				messages = {
					"Quit",
				},
			},
			["p"] = {
				help = "quit printing pwd",
				messages = {
					"PrintPwdAndQuit",
				},
			},
			["f"] = {
				help = "quit printing focus",
				messages = {
					"PrintFocusPathAndQuit",
				},
			},
			["s"] = {
				help = "quit printing selection",
				messages = {
					"PrintSelectionAndQuit",
				},
			},
			["r"] = {
				help = "quit printing result",
				messages = {
					"PrintResultAndQuit",
				},
			},
		},
	},
}
xplr.config.modes.builtin.search = {
	name = "search",
	prompt = "/",
	key_bindings = {
		on_key = {
			["up"] = {
				help = "up",
				messages = {
					"FocusPrevious",
				},
			},
			["down"] = {
				help = "down",
				messages = {
					"FocusNext",
				},
			},
			["right"] = {
				help = "enter",
				messages = {
					"Enter",
					{ SetInputBuffer = "" },
				},
			},
			["left"] = {
				help = "back",
				messages = {
					"Back",
					{ SetInputBuffer = "" },
				},
			},
			["tab"] = {
				help = "toggle selection",
				messages = {
					"ToggleSelection",
					"FocusNext",
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					"AcceptSearch",
					"PopMode",
				},
			},
			["esc"] = {
				help = "cancel",
				messages = {
					"CancelSearch",
					"PopMode",
				},
			},
		},
		default = {
			messages = {
				"UpdateInputBufferFromKey",
				"SearchFuzzyFromInput",
				"ExplorePwdAsync",
			},
		},
	},
}
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-n"] =
	xplr.config.modes.builtin.search.key_bindings.on_key["down"]
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-p"] =
	xplr.config.modes.builtin.search.key_bindings.on_key["up"]
xplr.config.modes.builtin.filter = {
	name = "filter",
	key_bindings = {
		on_key = {
			["r"] = {
				help = "relative path does match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["R"] = {
				help = "relative path does not match regex",
				messages = {
					{ SwitchModeBuiltin = "relative_path_does_not_match_regex" },
					{ SetInputBuffer = "" },
					{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"ExplorePwdAsync",
				},
			},
			["backspace"] = {
				help = "remove last filter",
				messages = {
					"RemoveLastNodeFilter",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "reset filters",
				messages = {
					"ResetNodeFilters",
					"ExplorePwdAsync",
				},
			},
			["ctrl-u"] = {
				help = "clear filters",
				messages = {
					"ClearNodeFilters",
					"ExplorePwdAsync",
				},
			},
		},
	},
}
xplr.config.modes.builtin.relative_path_does_match_regex = {
	name = "relative path does match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesMatchRegex.format,
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["esc"] = {
				messages = {
					{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}
xplr.config.modes.builtin.relative_path_does_not_match_regex = {
	name = "relative path does not match regex",
	prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesNotMatchRegex.format,
	key_bindings = {
		on_key = {
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["esc"] = {
				messages = {
					{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
					"PopMode",
					"ExplorePwdAsync",
				},
			},
		},
		default = {
			messages = {
				{ RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"UpdateInputBufferFromKey",
				{ AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
				"ExplorePwdAsync",
			},
		},
	},
}
xplr.config.modes.builtin.sort = {
	name = "sort",
	key_bindings = {
		on_key = {
			["!"] = {
				help = "reverse sorters",
				messages = {
					"ReverseNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["E"] = {
				help = "by canonical extension reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["M"] = {
				help = "by canonical mime essence reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["N"] = {
				help = "by node type reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = true } },
					{ AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = true } },
					{ AddNodeSorter = { sorter = "ByIsSymlink", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["R"] = {
				help = "by relative path reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByIRelativePath", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["S"] = {
				help = "by size reverse",
				messages = {
					{ AddNodeSorter = { sorter = "BySize", reverse = true } },
					"ExplorePwdAsync",
				},
			},
			["backspace"] = {
				help = "remove last sorter",
				messages = {
					"RemoveLastNodeSorter",
					"ExplorePwdAsync",
				},
			},
			["ctrl-r"] = {
				help = "reset sorters",
				messages = {
					"ResetNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["ctrl-u"] = {
				help = "clear sorters",
				messages = {
					"ClearNodeSorters",
					"ExplorePwdAsync",
				},
			},
			["e"] = {
				help = "by canonical extension",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["enter"] = {
				help = "submit",
				messages = {
					"PopMode",
				},
			},
			["m"] = {
				help = "by canonical mime essence",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["n"] = {
				help = "by node type",
				messages = {
					{ AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = false } },
					{ AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = false } },
					{ AddNodeSorter = { sorter = "ByIsSymlink", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["r"] = {
				help = "by relative path",
				messages = {
					{ AddNodeSorter = { sorter = "ByIRelativePath", reverse = false } },
					"ExplorePwdAsync",
				},
			},
			["s"] = {
				help = "by size",
				messages = {
					{ AddNodeSorter = { sorter = "BySize", reverse = false } },
					"ExplorePwdAsync",
				},
			},

			["c"] = {
				help = "by created",
				messages = {
					{ AddNodeSorter = { sorter = "ByCreated", reverse = false } },
					"ExplorePwdAsync",
				},
			},

			["C"] = {
				help = "by created reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByCreated", reverse = true } },
					"ExplorePwdAsync",
				},
			},

			["l"] = {
				help = "by last modified",
				messages = {
					{ AddNodeSorter = { sorter = "ByLastModified", reverse = false } },
					"ExplorePwdAsync",
				},
			},

			["L"] = {
				help = "by last modified reverse",
				messages = {
					{ AddNodeSorter = { sorter = "ByLastModified", reverse = true } },
					"ExplorePwdAsync",
				},
			},
		},
	},
}
xplr.config.modes.builtin.switch_layout = {
	name = "switch layout",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["1"] = {
				help = "default",
				messages = {
					{ SwitchLayoutBuiltin = "default" },
					"PopMode",
				},
			},
			["2"] = {
				help = "no help menu",
				messages = {
					{ SwitchLayoutBuiltin = "no_help" },
					"PopMode",
				},
			},
			["3"] = {
				help = "no selection panel",
				messages = {
					{ SwitchLayoutBuiltin = "no_selection" },
					"PopMode",
				},
			},
			["4"] = {
				help = "no help or selection",
				messages = {
					{ SwitchLayoutBuiltin = "no_help_no_selection" },
					"PopMode",
				},
			},
		},
	},
}
xplr.config.modes.builtin.vroot = {
	name = "vroot",
	layout = "HelpMenu",
	key_bindings = {
		on_key = {
			["v"] = {
				help = "toggle vroot",
				messages = {
					"PopMode",
					"ToggleVroot",
				},
			},
			["."] = {
				help = "vroot $PWD",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${PWD:?}"
            ]===],
					},
				},
			},
			["/"] = {
				help = "vroot /",
				messages = {
					"PopMode",
					{ SetVroot = "/" },
				},
			},
			["~"] = {
				help = "vroot $HOME",
				messages = {
					"PopMode",
					{
						BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${HOME:?}"
            ]===],
					},
				},
			},
			["ctrl-r"] = {
				help = "reset vroot",
				messages = {
					"PopMode",
					"ResetVroot",
				},
			},
			["ctrl-u"] = {
				help = "unset vroot",
				messages = {
					"PopMode",
					"UnsetVroot",
				},
			},
		},
	},
}
xplr.config.modes.custom = {}
xplr.fn.builtin.try_complete_path = function(m)
	if not m.input_buffer then
		return
	end

	local function matches_all(str, paths)
		for _, path in ipairs(paths) do
			if string.sub(path, 1, #str) ~= str then
				return false
			end
		end
		return true
	end

	local path = m.input_buffer
	local explorer_config = {
		filters = {
			{ filter = "RelativePathDoesStartWith", input = xplr.util.basename(path) },
		},
	}
	local parent = xplr.util.dirname(path)
	if not parent or parent == "" then
		parent = "./"
	elseif parent ~= "/" then
		parent = parent .. "/"
	end

	local nodes = xplr.util.explore(parent, explorer_config)
	local found = {}
	for _, node in ipairs(nodes) do
		table.insert(found, parent .. node.relative_path)
	end
	local count = #found

	if count == 0 then
		return
	elseif count == 1 then
		return {
			{ SetInputBuffer = found[1] },
		}
	else
		local first = found[1]
		while #first > #path and matches_all(path, found) do
			path = string.sub(first, 1, #path + 1)
		end

		if matches_all(path, found) then
			return {
				{ SetInputBuffer = path },
			}
		end

		return {
			{ SetInputBuffer = string.sub(path, 1, #path - 1) },
		}
	end
end
xplr.fn.builtin.fmt_general_table_row_cols_0 = function(m)
	local r = ""
	if m.is_before_focus then
		r = r .. " -"
	else
		r = r .. "  "
	end

	r = r .. m.relative_index .. "│" .. m.index

	return r
end
xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
	local r = m.tree .. m.prefix

	local function path_escape(path)
		return string.gsub(string.gsub(path, "\\", "\\\\"), "\n", "\\n")
	end

	if m.meta.icon == nil then
		r = r .. ""
	else
		r = r .. m.meta.icon .. " "
	end

	r = r .. path_escape(m.relative_path)

	if m.is_dir then
		r = r .. "/"
	end

	r = r .. m.suffix .. " "

	if m.is_symlink then
		r = r .. "-> "

		if m.is_broken then
			r = r .. "×"
		else
			r = r .. path_escape(m.symlink.absolute_path)

			if m.symlink.is_dir then
				r = r .. "/"
			end
		end
	end

	return r
end
xplr.fn.builtin.fmt_general_table_row_cols_2 = function(m)
	local no_color = os.getenv("NO_COLOR")

	local function green(x)
		if no_color == nil then
			return "\x1b[32m" .. x .. "\x1b[0m"
		else
			return x
		end
	end

	local function yellow(x)
		if no_color == nil then
			return "\x1b[33m" .. x .. "\x1b[0m"
		else
			return x
		end
	end

	local function red(x)
		if no_color == nil then
			return "\x1b[31m" .. x .. "\x1b[0m"
		else
			return x
		end
	end

	local function bit(x, color, cond)
		if cond then
			return color(x)
		else
			return color("-")
		end
	end

	local p = m.permissions

	local r = ""

	r = r .. bit("r", green, p.user_read)
	r = r .. bit("w", yellow, p.user_write)

	if p.user_execute == false and p.setuid == false then
		r = r .. bit("-", red, p.user_execute)
	elseif p.user_execute == true and p.setuid == false then
		r = r .. bit("x", red, p.user_execute)
	elseif p.user_execute == false and p.setuid == true then
		r = r .. bit("S", red, p.user_execute)
	else
		r = r .. bit("s", red, p.user_execute)
	end

	r = r .. bit("r", green, p.group_read)
	r = r .. bit("w", yellow, p.group_write)

	if p.group_execute == false and p.setuid == false then
		r = r .. bit("-", red, p.group_execute)
	elseif p.group_execute == true and p.setuid == false then
		r = r .. bit("x", red, p.group_execute)
	elseif p.group_execute == false and p.setuid == true then
		r = r .. bit("S", red, p.group_execute)
	else
		r = r .. bit("s", red, p.group_execute)
	end

	r = r .. bit("r", green, p.other_read)
	r = r .. bit("w", yellow, p.other_write)

	if p.other_execute == false and p.setuid == false then
		r = r .. bit("-", red, p.other_execute)
	elseif p.other_execute == true and p.setuid == false then
		r = r .. bit("x", red, p.other_execute)
	elseif p.other_execute == false and p.setuid == true then
		r = r .. bit("T", red, p.other_execute)
	else
		r = r .. bit("t", red, p.other_execute)
	end

	return r
end
xplr.fn.builtin.fmt_general_table_row_cols_3 = function(m)
	if not m.is_dir then
		return m.human_size
	else
		return ""
	end
end
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
	return tostring(os.date("%a %b %d %H:%M:%S %Y", m.last_modified / 1000000000))
end
xplr.fn.custom = {}
local home = os.getenv("HOME")
package.path = home .. "/.config/xplr/plugins/?/init.lua;" .. home .. "/.config/xplr/plugins/?.lua;" .. package.path
require("icons").setup()
require("fzf").setup({
	mode = "default",
	key = "ctrl-f",
	bin = "fzf",
	args = "--preview 'pistol {}'",
	recursive = true, -- If true, search all files under $PWD
	enter_dir = false, -- Enter if the result is directory
})
require("xclip").setup({
	copy_command = "xclip-copyfile",
	copy_paths_command = "xclip -sel clip",
	paste_command = "xclip-pastefile",
	keep_selection = false,
})
return {
	on_load = {},
	on_directory_change = {},
	on_focus_change = {},
	on_mode_switch = {},
	on_layout_switch = {},
}
