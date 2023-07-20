-- general
lvim.log.level = "info"
lvim.format_on_save.enabled = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = false

lvim.builtin.alpha.dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local function footer()
	return "Zakwan Hisham"
end

lvim.builtin.alpha.dashboard.section.footer.val = footer()
lvim.builtin.alpha.dashboard.section.footer.opts.hl = "Type"
