return {
	"williamboman/mason.nvim",
	config = true,
	require('mason').setup({
		ui = {
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			}
		}
	})
}
