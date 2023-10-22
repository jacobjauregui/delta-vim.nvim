return {
	'williamboman/mason-lspconfig.nvim',
	config = function()
		require('mason-lspconfig').setup({
			ensure_installed = {
--				'csharp_ls',
				'html',
				'lua_ls',
				'pyright',
			},
		})
	end,
}
