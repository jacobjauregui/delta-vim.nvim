local M = {}

local search_theme = function(themenr)
	local themes = require('plugins.themes')
	for n, theme in ipairs(themes) do
		for t, th in pairs(theme) do
			if themenr == n then
                print('colorscheme = {' .. th .. '}')
            end
		end
	end
end

local default = search_theme(1)

M.colorscheme = default
M.background = 'dark'

M.ui = {
    theme = 'default',
	statusline = {},
	tabline = {},
}


return M

