-- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md

local M = {}

-- local ok, lualine = pcall(require, "lualine")
local lualine = require('lualine')
-- if not ok then
	-- return
-- end
--[[ 
local nvim_tree_shift = {
	function()
		return string.rep(' ',
			vim.api.nvim_win_get_width(require'nvim-tree.view'.get_winnr()) - 2)
	end,
	cond = require('nvim-tree.view').is_visible,
--	color = 'NvimTreeNormal'
}
 ]]

local dracula = require('lualine.themes.dracula')
local color = require("config.colors.dracula")
local c = color.base_30

dracula.normal.a.bg = c.green
dracula.normal.a.fg = c.black
dracula.insert.a.bg = c.red
dracula.insert.a.fg = c.black
dracula.visual.a.bg = c.cyan
dracula.visual.a.fg = c.black
dracula.command.a.bg = c.orange
dracula.command.a.fg = c.black
dracula.replace.a.bg = c.red
dracula.replace.a.fg = c.dark_purple
dracula.inactive.a.bg = c.darker_black
dracula.inactive.a.fg = c.gray

dracula.normal.b.bg = c.white
dracula.normal.b.fg = c.darker_black
dracula.insert.b.bg = c.white
dracula.insert.b.fg = c.darker_black
dracula.visual.b.bg = c.white
dracula.visual.b.fg = c.darker_black
dracula.command.b.bg = c.white
dracula.command.b.fg = c.darker_black
dracula.replace.b.bg = c.white
dracula.replace.b.fg = c.darker_black
dracula.inactive.b.bg = c.white
dracula.inactive.b.fg = c.darker_black

dracula.normal.c.bg = c.darker_black
dracula.normal.c.fg = c.purple
dracula.insert.c.bg = c.darker_black
dracula.insert.c.fg = c.purple
dracula.visual.c.bg = c.darke_black
dracula.visual.c.fg = c.purple
dracula.command.c.bg = c.darker_black
dracula.command.c.fg = c.purple
dracula.replace.c.bg = c.darker_black
dracula.replace.c.fg = c.grey
dracula.inactive.c.bg = c.darker_black
dracula.inactive.c.fg = c.grey

local separators = {
	default = '█',
-- LEFT
	l_arrow = '',
	l_round = '', --
	l_flag = '',
	l_slash = '',
	l_space = '',
	l_diagonal = '',
	l_trap = '',
	l_fire = '',
-- RIGHT
	r_arrow = '',
	r_diagonal = '',
	r_round = '',--
	r_flag = '',
	r_slash = '',
	r_space = '',--
	r_trap = '',
	r_fire = '',
}

local sep = function(side, separator)
	local s = separators
	if separator == 'arrow' and side == 1 then
		return s.l_arrow
	elseif separator == 'arrow' and side == 2 then
		return s.r_arrow
	elseif separator == 'round' and side == 1 then
		return s.l_round
	elseif separator == 'round' and side == 2 then
		return s.r_round
	elseif separator == 'flag' and side == 1 then
		return s.l_flag
	elseif separator == 'flag' and side == 2 then
		return s.r_flag
	elseif separator == 'slash' and side == 1 then
		return s.l_slash
	elseif separator == 'slash' and side == 2 then
		return s.r_slash
	elseif separator == 'space' and side == 1 then
		return s.l_space
	elseif separator == 'space' and side == 2 then
		return s.r_space
	elseif separator == 'diagonal' and side == 1 then
		return s.l_diagonal
	elseif separator == 'diagonal' and side == 2 then
		return s.r_diagonal
	elseif separator == 'trap' and side == 1 then
		return s.l_trap
	elseif separator == 'trap' and side == 2 then
		return s.r_trap
	elseif separator == 'fire' and side == 1 then
		return s.l_fire
	elseif separator == 'fire' and side == 2 then
		return s.r_fire
	else
		return s.default
	end
end

local icon = function()
	local m = vim.api.nvim_get_mode().mode
	local icon_mode = ''
	if m == 'i' then
		icon_mode = '󰌌'
	elseif m == 'c' then
		icon_mode = ''
	elseif m == 'v' or m == 'V' then
		icon_mode = ''
	elseif m == 'R' or m == 'Rc' or m == 'Rv' or m == 'Rx' then
		icon_mode = ''
	elseif m == 't' then
		icon_mode = ''
	else
		icon_mode = '󰕣'
	end
	return icon_mode
end


local encoding = function()
	local utf = vim.bo.fileencoding
	local encoding_to_upper = utf.upper(utf)
	return encoding_to_upper
end



function M.setup()
	lualine.setup({
		options = {
			icons_enabled = true,
			theme = dracula,
			component_separators = {
				left = '',
				right = ''
			},
			section_separators = {
				left = sep(1, 'space'), -- arrow, default, round, flag, slash, space, diagonal, trap, fire
				right = sep(2, 'space')
			},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{ 'mode', icon = icon() },
			},
			lualine_b = {
				{'branch',
					icon = '',
				},
				{'diff',
					colored = true,
					diff_color = {
						added = { fg = c.green },
						modified = { fg = c.orange },
						removed = { fg = c.red },
					},
					symbols = {added = ' ', modified = '柳 ', removed = ' '},
				},
			},
			lualine_c = {
				{'filename',
					file_status = false,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = '●',
						readonly = '',
						unnamed = '',
						newfile = '',
					},
				},
			},
			lualine_x = {},
			lualine_y = { { encoding } },
			lualine_z = {
				{
					"%< %l/%L |  %c%V",
					padding = { left = 1, right = 1 },
                    color = { bg = c.cyan, fg = c.darker_black, gui = 'bold' },
				},
			},
		},
		inactive_sections = {
			lualine_a = {
				{'mode',
					icon = icon(),
				},
			},
			lualine_b = {
				{'branch',
					icon = '',
				},
				{'diff',
					colored = true,
					diff_color = {
						added = { fg = c.green },
						modified = { fg = c.orange },
						removed = { fg = c.red },
					},
					symbols = {added = ' ', modified = '柳 ', removed = ' '},
				},
			},
			lualine_c = {
				{'filename',
					file_status = false,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = '●',
						readonly = '',
						unnamed = '',
						newfile = '',
					},
				},
			},
			lualine_x = {},
			lualine_y = { { encoding } },
			lualine_z = {
				{
					" %l/%L |  %c%V",
					padding = { left = 2, right = 2 },
				},
			},
		},
		tabline = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				--%f, %F, %t f=relative path, F=full path, t=tile of file
				--%!, ! = evaluate expr
				--%<, <= truncate string to max lenght
				--%= is a separation between lhs and rhs
				--%m filenstatus [+] [-]
				--%r file is readonly [RO]
				--%y filetype
				--%q quickfix list Location list
				--%k keymap name
				--%n buffer number
				--%b value of character under cursor
				--%B as above, in hex
				--%l line number
				--%L number of lines
				--%c column number
				--%V virtual column number
				--%p percentage in file
				--%S showcmd
				--%{local fn = function() return %t end} return "%t"
				--%{local fn = function() return %t end %} return "Name of current file"
				--%T start of tab
				--%X end of tab, use %999X for a "close" button
				--%# highlight group, %#HighLightGroup#
				--%* highlight group 1-9
				{
					'buffers',
					show_filename_only = true,
					hide_filename_extension = true,
					show_modified_status = false,
					mode = 0,
					max_length = vim.o.columns * 2 / 3,
					filetype_names = {
						TelescopePrompt = 'Telescope',
						dashboard = 'Dashboard',
						packer = 'LazyNvim',
						fzf = 'FZF',
						alpha = 'Alpha',
					},
					use_mode_colors = true,
					buffers_color = {
						active = { bg = c.dark_purple, fg = c.white },
						inactive = { bg = c.black, fg = c.grey, gui = 'italic' },
					},
					separator = { left = sep(2,'diagonal'), right = sep(1, 'diagonal') },
					padding = { left = 2, right = 2 },
				},
				{
					'%999X%X',
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{
					"os.date('%H:%M | %d/%m/%Y')",
					separator = { left = sep(2, 'round'), right = sep(1, 'round') },
					color = { fg = c.black, bg = c.purple, gui = 'bold' }
				},
--[[ 
				{
					'tabs',
					draw_empty = true,
					separator = sep(1, 'arrow'),
					tab_max_length = 20,
					max_length = vim.o.columns / 3,
					mode = 0,
					path = 0,
					use_mode_colors = false,
					tabs_color = {
						active = { bg = c.darker_black, fg = c.white, gui = 'italic'},
						inactive = { bg = c.black, fg = c.purple, gui = 'italic' },
					},
					show_modified_status = false,
					symbols = {
						modified = '●',
					},
					cond = nil,
				}, ]]
			},
		},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
		},
		extensions = {
			'nvim-tree',
		},
	})
end


return M

