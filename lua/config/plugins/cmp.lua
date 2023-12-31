---@diagnostic disable: missing-fields
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local M = {}

function M.setup()
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-o>'] = cmp.mapping.scroll_docs(4),
			['<C-a>'] = cmp.mapping.abort(),
			['<C-n>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C><CR>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			['<c-space>'] = cmp.mapping.complete(),
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'path' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'nvim_lua' },
			{ name = 'nvim_autopairs' },
		},
	})
	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({ { name = 'git' }, }, { { name = 'buffer' },
		})
	})
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' },
		},
	})
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
	})
end

return M
