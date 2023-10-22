return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	cmd = "Telescope",
	config = true,
}
