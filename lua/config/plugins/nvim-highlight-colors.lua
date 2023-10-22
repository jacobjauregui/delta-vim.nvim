local hl = require'nvim-highlight-colors'

local M = {}

function M.setup()
	hl.setup({
		render = 'background', --'foreground', fisrt_column
		enable_named_colors = true,
		enable_tailwind = true,
		custom_colors = {},

  })
end




return M
