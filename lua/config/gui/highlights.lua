-- Highlights groups
local theme = require('config.colors.dracula')
local c = theme.base_30

local hl = vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 3, bg = c.red })



local M = {}

M.hls_groups = {
--	ColorColumn = {},
	Cursor = {},
	CursorLine = {},
	Folded = {},
	FoldColumn = {},
	IncSearch = {},
	Substitute = {},
	LineNr = {},
	CursorLineNr = {},
	Normal = { ctermfg = c.grey, ctermbg = c.black },
	FloatBorder = {},
	FloatTitle = {},
	TabLine = {},
	TabLineFill = {},
	TabLineSel = {},
	Visual = {},
	Whitespace = {},
	WildMenu = {},
	WinBar = {},
	WinBarNC = {},
	Scrollbar = { guibg = '#282a36', guifg = '#44475a'},

	h = function()
		return hl
	end,
}










return M
