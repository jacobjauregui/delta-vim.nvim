local ibl = require('ibl')

M = {}

function M.setup()
	ibl.setup({
		enabled = true,
		debounce = 100,
		viewport_buffer = { min = 50, max = 200 },
		indent = {
			char = '║',
			--tab_char = { '║', '║', ' ' },
			highlight = 'hl-IbLIndent',
			smart_indent_cap = true,
			priority = 1,
		},
		whitespace = {
			highlight = 'hl-IblWhitespace',
			char = '·',
			remove_blankline_trail = true,
		},
		scope = {
			enabled = true,
			char = ibl.config.indent.char,
			show_start = true,
			show_end = true,
			show_exact_scope = false,
			injected_languages = true,
			highlight = 'hl-IblScope',
			--priority = 1024,
			--include = {},
			--exclude = {},
		},
		exclude = {
			filetypes = {
				'lspinfo',
				'packer',
				'checkhealth',
				'help',
				'man',
				'gitcommit',
				'TelescopePrompt',
				'TelescopeResults',
				--'',
			},
			buftypes = {
				'terminal',
				'nofile',
				'quickfix',
				'prompt',
			},
		},
	})
end

return M
