-- New higlights can be added here.

local hl = vim.api.nvim_set_hl

local color = require('config.gui.colors.color').scheme

local M = {}

function M.setup()
	M.highlights = {
-- _______________________________ Syntax ______________________________________
		hl(0, 'Comment', { fg = color.grey }), -- all comments
		hl(0, 'Constant', { fg = color.white }), -- any constant
		hl(0, 'Delimiter', { fg = color.yellow }), -- delimiters: . , ; ()
		hl(0, 'Identifier', { fg = color.white }), -- any variable name
		hl(0, 'String', { fg = color.green }), -- any string
		hl(0, 'Character', { fg = color.orange }), -- chars: 'c', 'n', '9'...
		hl(0, 'Number', { fg = color.blue }), -- int, float, etc
		hl(0, 'Float', { fg = color.blue }), -- float
		hl(0, 'Function', { fg = color.yellow }), -- methods
		hl(0, 'Boolean', { fg = color.violet }), -- true/false
		hl(0, 'Conditional', { fg = color.pink }), -- if/then/else
		hl(0, 'Repeat', { fg = color.pink }), -- loop for/while
		hl(0, 'Operator', { fg = color.red }), -- operators: +, -, *, =, >...
		hl(0, 'Label', { fg = color.sky }), -- case, default, etc
		hl(0, 'Keyword', { fg = color.sky }), -- keywords like local, in, or...
		hl(0, 'Statement', { fg = color.aqua }), -- any statement
		hl(0, 'SpecialChar', { fg = color.orange }), -- chars like \n, %t, etc')
		hl(0, 'Type', { fg = color.sky }), -- any type
		hl(0, 'Typedef', { fg = color.sky }), -- any type definition')
		hl(0, 'Special', { fg = color.purple }), -- any special symbol
-- _______________________________ Editor _____________________________________
		hl(0, 'ColorColumn', { bg = color.dark_grey, fg = color.black }),
		hl(0, 'Cursor'      ,{ fg=color.white, bg=color.black }),
		-- hl(0, 'CursorColumn', { bg = color.dark }),
		hl(0, 'CursorLine', { bg = color.dark}),
		hl(0, 'CursorLineNr', { fg = color.white, bg = color.black }),
		hl(0, 'CurSearch'   ,{ fg=color.dark, bg=color.yellow }),
		hl(0, 'Directory'   ,{ fg=color.blue }),
		hl(0, 'DiffAdd', { fg = color.green, bg = color.black}),
		hl(0, 'DiffChange', { fg = color.yellow, bg = color.black }),
		hl(0, 'DiffDelete', { fg = color.red, bg = color.black }),
		hl(0, 'DiffText', { fg = color.blue, bg = color.black }),
		hl(0, 'EndOfBuffer', { fg = color.dark }),
		hl(0, 'FoldColumn', { fg = color.white }),
		hl(0, 'Folded', { fg = color.grey, bg = color.black }),
		hl(0, 'IncSearch'   ,{ fg=color.black, bg=color.grey }),
		hl(0, 'lCursor'     ,{ fg=color.dark, bg=color.white }),
		hl(0, 'LineNr', { fg = color.grey }),
		hl(0, 'NonText', { fg = color.light_grey }),
		hl(0, 'Search'      ,{ fg=color.yellow, bg=color.dark_grey }),
		hl(0, 'SignColumn', { fg = color.white }),
		hl(0, 'Substitute'  ,{ fg=color.red, bg=color.dark_grey }),
--________________________ Windows, Tabs and Buffers __________________________
		hl(0, 'FloatTitle', { fg=color.green }),
		hl(0, 'FloatBorder', { fg=color.purple }),
		hl(0, 'FloatShadow', { bg=color.green }), -- blend=80),
		hl(0, 'StatusLine', { fg=color.black, bg=color.grey }),
		hl(0, 'StatusLineNC', { fg=color.grey, bg=color.dark_grey }),
		hl(0, 'TabLine', { fg=color.grey, bg=color.dark_grey }),
		hl(0, 'TabLineSel', { fg=color.white, bg=color.dark }),
		hl(0, 'WinBar', { fg=color.black }),
		hl(0, 'WinBarNC', { fg=color.black }),
		hl(0, 'MsgSeparator', { fg=color.green }),
		hl(0, 'MsgArea', { bg=color.black }),
		hl(0, 'ErrorMsg', { fg=color.red }), -- cterm=bold,italic gui=bold,italic ),
		hl(0, 'MoreMsg', { fg=color.green }),
		hl(0, 'WarningMsg', { fg=color.yellow }),
		hl(0, 'ModeMsg', { fg=color.black }), -- cterm=bold gui=bold ),
		hl(0, 'Normal', { fg=color.white, bg=color.black }),
		hl(0, 'NormalNC', { fg=color.grey, bg=color.black }),
		hl(0, 'NormalFloat', { fg=color.white, bg=color.dark }),
		hl(0, 'Visual', { bg=color.dark_grey }), -- cterm=bold gui=bold ),
		hl(0, 'Title', { fg=color.green }), --cterm=bold gui=bold ),
		hl(0, 'VertSplit', { fg=color.purple }),
		hl(0, 'WildMenu', { bg=color.light_grey }),
	}
end

return M
