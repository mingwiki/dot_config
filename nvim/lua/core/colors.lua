-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Neovim UI color scheme.
-- Add the selected color scheme in the `require` values below.
-- Current available color schemes: onedark, monokai, rose-pine.
local status_ok, color_scheme = pcall(require, "onedark")
if not status_ok then
	return
end

-- Note: The instruction to load the color scheme may vary.
-- See the README of the selected color scheme for the instruction
-- to use.
-- e.g.: require('color_scheme').setup{}, vim.cmd('color_scheme') ...
require("onedark").setup({
	-- styles: dark, darker, cool, deep, warm, warmer, light
	style = "darker",
	colors = { fg = "#b2bbcc" }, --default: #a0a8b7
})
require("onedark").load()

--[[
Statusline color schemes.
Import the following color schemes in your statusline.lua file
with: `require('core/colors').colorscheme_name` where the colors scheme name
is the value of the variables below.

e.g.: `local colors = require('core/colors').onedark_dark
See: `core/statusline.lua`

The color schemes below are created by following the "palette" file color
schemes. Color names are adapted to maintain a pattern, original names can be
different.
--]]
local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
	bg = "#282c34",
	fg = "#b2bbcc",
	pink = "#c678dd",
	green = "#98c379",
	cyan = "#56b6c2",
	yellow = "#e5c07b",
	orange = "#d19a66",
	red = "#e86671",
}

return M
