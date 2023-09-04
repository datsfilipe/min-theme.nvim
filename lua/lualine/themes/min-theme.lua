local colors = require("min-theme.colors")
local config = require("min-theme.config")
local min = {}

local bg = config.transparent and "NONE" or colors.bg

min.normal = {
	a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
	c = { bg = bg, fg = colors.bg },
}

min.insert = {
	a = { bg = colors.red, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
}

min.terminal = {
	a = { bg = colors.green, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
}

min.command = {
	a = { bg = colors.green, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
}

min.visual = {
	a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
}

min.replace = {
	a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
	b = { bg = bg, fg = colors.comment },
}

min.inactive = {
	a = { bg = colors.comment, fg = colors.bg },
	b = { bg = bg, fg = colors.orange, gui = "bold" },
	c = { bg = bg, fg = colors.orange },
}

return min
