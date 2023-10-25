-- New higlights can be added here.

local hl = vim.api.nvim_set_hl

local color = require('config.gui.colors.color').scheme

local M = {}

local n = 10
local Char = 'c'

function Verifier()
	for i, x in pairs(M) do
		if type(x) == 'function' or i == false then
			M[i] = function(...)
				print('This is ' .. i .. ' a test of ' .. n .. '\n Please...' )
				return x(...)
			end
		end
	end
end

function M.setup()
	M.highlights = {
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
		hl(0, 'Special', { fg = color.purple }), -- any special symbol
		hl(0, 'SpecialChar', { fg = color.orange }), -- chars like \n, %t, etc')
		hl(0, 'Type', { fg = color.olive }), -- any type
		hl(0, 'Typedef', { fg = color.olive }), -- any type definition')
		hl(0, 'Cursor', { fg = color.white, bg = color.black }),
		-- hl(0, 'CursorColumn', { bg = color.dark }),
		hl(0, 'CursorLine', { bg = color.dark}),
		hl(0, 'ColorColumn', { bg = color.red, fg = color.black }),
		hl(0, 'CursorLineNr', { fg = color.blue, bg = color.black }),
		hl(0, 'LineNr', { fg = color.grey }),
		-- hl(0, 'Folded', { fg = color.grey, bg = color.black }),
		hl(0, 'FoldColumn', { fg = color.white }),
		hl(0, 'SignColumn', { fg = color.white }),
		hl(0, 'DiffAdd', { fg = color.green, bg = color.black}),
		hl(0, 'DiffChange', { fg = color.yellow, bg = color.black }),
		hl(0, 'DiffDelete', { fg = color.red, bg = color.black }),
		hl(0, 'DiffText', { fg = color.blue, bg = color.black }),
		hl(0, 'Normal', { fg = color.white, bg = color.black }),
		-- hl(0, 'NormalNC', { fg = color.light_grey, bg = color.dark }),
		-- hl(0, 'EndOfBuffer', { fg = color.dark }),
		hl(0, 'NonText', { fg = color.light_grey }),
	}
end

return M
