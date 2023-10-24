-- New higlights can be added here.

local hl = vim.api.nvim_set_hl

local color = require('config.gui.colors.color').scheme

local M = {}

function M.setup()
	M.highlights = {
		hl(0, 'Normal', { fg = color.white, bg = color.dark }),
		hl(0, 'Folded', { fg = color.blue, bg = color.dark_grey }),
		hl(0, 'Comment', { fg = color.grey }),
		hl(0, 'ColorColumn', { bg = color.red }),
		hl(0, 'CursorColumn', { bg = color.dark_grey }),
		hl(0, 'CursorLine', { bg = color.dark_grey }),
		hl(0, 'CursorLineNr', { fg = color.light_grey }),
		hl(0, 'DiffAdd', { bg = color.green }),
		hl(0, 'DiffChange', { bg = color.orange }),
		hl(0, 'DiffDelete', { bg = color.red }),
		hl(0, 'DiffText', { bg = color.dark_grey }),
		hl(0, 'EndOfBuffer', { fg = color.dark }),
		hl(0, 'FoldColumn', { fg = color.light_grey }),
		hl(0, 'LineNr', { fg = color.light_grey }),
		hl(0, 'NonText', { fg = color.dark }),
		hl(0, 'SignColumn', { fg = color.white }),
	}
end

return M
