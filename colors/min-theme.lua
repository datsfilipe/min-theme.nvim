---@diagnostic disable: undefined-global
local config = require("config")
local options = config.options
local load = config.load

if options.style == "dark" then
	vim.o.background = "dark"
elseif options.style == "light" then
	vim.o.background = "light"
end

load()
