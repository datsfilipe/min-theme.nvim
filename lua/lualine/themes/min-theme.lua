local colors = require("min-theme.colors")
local config = require("min-theme.config")
local min = {}

local bg = config.transparent and "NONE" or colors.bg

min.normal = {
	a = { bg = colors.blue, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.blue, fg = colors.fgAlt },
}

min.insert = {
	a = { bg = colors.red, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.red, fg = colors.fgAlt },
}

min.terminal = {
	a = { bg = colors.green, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.green, fg = colors.fgAlt },
}

min.command = {
	a = { bg = colors.green, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.green, fg = colors.fgAlt },
}

min.visual = {
	a = { bg = colors.purple, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.purple, fg = colors.fgAlt },
}

min.replace = {
	a = { bg = colors.orange, fg = colors.fgAlt, gui = "bold" },
	b = { bg = bg, fg = colors.fg },
	c = { bg = colors.orange, fg = colors.fgAlt },
}

min.inactive = {
	a = { bg = bg, fg = colors.red },
	b = { bg = bg, fg = colors.fg, gui = "bold" },
	c = { bg = bg, fg = colors.red },
}

return min
