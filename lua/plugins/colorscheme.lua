
--
-- return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	flavour = "macchiato",-- "late, frappe, macchiato, mocha
-- 	background = {
-- 		light = "latte",
-- 		dark = "mocha",
-- 	},
-- 	trasparent_background = false,
-- 	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--     term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		treesitter = true,
-- 		notify = false,
-- 	},
-- 	config = function()
-- 		vim.cmd([[colorscheme catppuccin]])
-- 	end,
-- }

return
	{
	"baliestri/aura-theme",
	lazy = false,
	priority = 1000,
	config = function(plugin)
	  vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	  vim.cmd([[colorscheme aura-dark]])
	end
}
