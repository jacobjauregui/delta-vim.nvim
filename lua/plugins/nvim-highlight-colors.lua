return {
	'brenoprata10/nvim-highlight-colors',
	cmd = {
		'HighlightColorsOn',
		'HighlightColorsOff',
		'HighlightColorsToggle',
	},
	main = function()
		require('config.plugins.nvim-highlight-colors').setup()
	end,
	config = true,
}
