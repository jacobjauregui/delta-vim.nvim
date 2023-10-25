-- https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md

local M = {}

local lualine = require('lualine')
local dracula = require('lualine.themes.dracula')
local c = require("config.gui.colors.color").scheme

dracula.normal.a.bg = c.green
dracula.normal.a.fg = c.black
dracula.insert.a.bg = c.red
dracula.insert.a.fg = c.black
dracula.visual.a.bg = c.blue
dracula.visual.a.fg = c.black
dracula.command.a.bg = c.orange
dracula.command.a.fg = c.black
dracula.replace.a.bg = c.red
dracula.replace.a.fg = c.black
dracula.inactive.a.bg = c.grey
dracula.inactive.a.fg = c.light_grey

dracula.normal.b.bg = c.dark
dracula.insert.b.bg = c.dark
dracula.visual.b.bg = c.dark
dracula.command.b.bg = c.dark
dracula.replace.b.bg = c.dark
dracula.normal.b.fg = c.white
dracula.insert.b.fg = c.white
dracula.visual.b.fg = c.white
dracula.command.b.fg = c.white
dracula.replace.b.fg = c.white
dracula.inactive.b.bg = c.dark_grey
dracula.inactive.b.fg = c.light_grey

dracula.normal.c.bg = c.light_grey
dracula.insert.c.bg = c.light_grey
dracula.visual.c.bg = c.light_grey
dracula.command.c.bg = c.light_grey
dracula.replace.c.bg = c.light_grey
dracula.normal.c.fg = c.black
dracula.insert.c.fg = c.black
dracula.visual.c.fg = c.black
dracula.command.c.fg = c.black
dracula.replace.c.fg = c.black
dracula.inactive.c.bg = c.black
dracula.inactive.c.fg = c.light_grey

local separators = {
	default = '█',
	l_arrow = '',
	l_round = '', --
	l_flag = '',
	l_slash = '',
	l_space = '',
	l_diagonal = '',
	l_trap = '',
	l_fire = '',
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
				statusline = {
                    'NvimTree',
                },
				winbar = {
                    'NvimTree',
                },
			},
			ignore_focus = {
                    'NvimTree',
            },
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 500,
				tabline = 500,
				winbar = 500,
			},
		},
		sections = {
			lualine_a = {
				{'mode',
                    icon = icon(),
                    draw_empty = false,
                },
			},
			lualine_b = {
				{'branch',
					icon = '',
                    color = { gui = 'bold' },
				},
				{'diff',
					icon = '󰊤',
					colored = true,
					diff_color = {
						added = { fg = c.green, gui = 'bold' },
						modified = { fg = c.yellow, gui = 'bold' },
						removed = { fg = c.red, gui = 'bold' },
					},
					symbols = {added = ' ', modified = ' ', removed = ' '},
				},
			},
			lualine_c = {
				{'filename',
					file_status = false,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = ' ●',
						readonly = ' ',
						unnamed = ' ',
						newfile = ' ',
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
					icon = '󰊤 ',
				},
				{'diff',
					colored = true,
					diff_color = {
						added = { fg = '#006414', gui = 'bold' },
						modified = { fg = '#DF7800', gui = 'bold' },
						removed = { fg = '#82151d', gui = 'bold' },
					},
					symbols = {added = ' ', modified = ' ', removed = ' '},
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
			lualine_a = {
				{
					'%T%T',
					color = { bg = c.dark_grey, fg = c.green },
				},
			},
			lualine_b = {},
			lualine_c = {
				--%b value of character under cursor
				--%B as above, in hex
				--%c column number
				--%f relative path
				--%F full path
				--%k keymap name
				--%l line number
				--%L number of lines
				--%m filestatus [+] [-]
				--%n buffer number
				--%p percentage in file
				--%q quickfix list Location list
				--%r file is readonly [RO]
				--%S showcmd
				--%T start of tab
                --%t tile of file
				--%V virtual column number
				--%X end of tab, use %999X for a "close" button
				--%y filetype
				--%# highlight group, %#HighLightGroup#
				--%* highlight group 1-9
				--%! evaluate expr
				--%< truncate string to max lenght
                --%- align string to left
                --%= align string to center
				--% is a separation between lhs and rhs
				--% {local fn = function() return %t end} return "%t"
				--% {local fn = function() return %t end %} return "Name of current file"
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
                        NvimTree = 'NvimTree',
					},
					use_mode_colors = true,
					buffers_color = {
						active = { bg = c.dark_grey, fg = c.white },
						inactive = { bg = c.grey, fg = c.black, gui = 'italic' },
					},
					separator = { left = '', right = sep(1, 'diagonal') },
					padding = { left = 2, right = 2 },
				},
			},
			lualine_x = {
				{
					'tabs',
					draw_empty = false,
					separator = { left = '', right = sep(1, 'diagonal') },
					tab_max_length = 20,
					--max_length = vim.o.columns / 3,
					mode = 0,
					path = 0,
					use_mode_colors = false,
					tabs_color = {
						active = { bg = c.dark_grey, fg = c.white, gui = 'bold' },
						inactive = { bg = c.grey, fg = c.black, gui = 'italic' },
					},
					show_modified_status = false,
					symbols = {
						modified = '●',
					},
					cond = nil,
					{
						'%999X󰅗%X',
						color = { bg = c.dark_grey, fg = c.red, },
					},
				},
			},
			lualine_y = {},
			lualine_z = {
				{
					"os.date('%H:%M | %d/%m/%Y')",
					separator = { left = sep(2, 'round'), right = sep(1, 'round') },
					color = { fg = '#20a3b4', bg = '#1e1e1e', gui = 'bold' }
				},
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
		extensions = {},
	})
end

return M

