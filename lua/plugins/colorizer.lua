return {
	"norcalli/nvim-colorizer.lua",
	opts = {
		defaults = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			-- Available modes: foreground, background
			mode = "background",
		},

	},
	--config = function(_, opts)
	--	require("colorizer").setup(opts)
	--	vim.defer_fn(function()
	--		require("colorizer").attach_to_buffer(0)
	--	end, 0)
	--end,
}
