---@diagnostic disable: undefined-global
local lush = require("lush")
local M = {}

local defaultOptions = {
	style = "auto", -- auto | light | dark
	transparent = false,
	italics = false,
}

M.options = defaultOptions

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, defaultOptions, options or {})
end

function M.load()
	local theme = require("lush_theme.min-theme")
	vim.g.colors_name = "min-theme"
	package.loaded["lush_theme.min-theme"] = nil

	-- transparent
	if M.options.transparent == true and not isGui then
		theme = lush.extends({ theme }).with(function()
			return {
				Normal({ theme.Normal, bg = "NONE" }), -- normal text
				NormalSB({ bg = "NONE" }),
				BufferlineFill({ bg = "NONE" }),
				TroubleNormal({ bg = "NONE" }),
				NvimTreeNormal({ bg = "NONE" }),
				NvimTreeNormalNC({ bg = "NONE" }),
				BufferInactive({ theme.BufferInactive, bg = "NONE" }),
				BufferVisible({ theme.BufferCurrent }),
			}
		end)
	end

	-- italics
	if M.options.italics == true then
		theme = lush.extends({ theme }).with(function(injected_functions)
			local sym = injected_functions.sym
			return {
				Statement({ theme.Statement, gui = "italic" }),
				Boolean({ theme.Boolean, gui = "italic" }),
				Comment({ theme.Comment, gui = "italic" }),
				sym("@tag.attribute")({ theme["@tag.attribute"], gui = "italic" }),
				sym("@annotation")({ theme["@annotation"], gui = "italic" }),
			}
		end)
	end

	-- bufferline
	local bufferlineInstalled = pcall(require, "bufferline")
	if bufferlineInstalled then
		theme = lush.extends({ theme }).with(function()
			return {
				TabLineSel({ bg = theme.Statement.fg }), -- tab pages line, active tab page label
			}
		end)
	end

	lush(theme)
end

return M
