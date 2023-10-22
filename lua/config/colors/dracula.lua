local M = {}

M.base_16 = {
	base00 = "#050616", --"#282936", main bg
	base01 = "#2B2B3B", --"#3a3c4e",
	base02 = "#4D4F68",
	base03 = "#626483",
	base04 = "#62D6E8",
	base05 = "#E9E9F4",
	base06 = "#F1F2F8",
	base07 = "#F7F7FB",
	base08 = "#C197FD",
	base09 = "#FFB86C",
	base0A = "#62D6E8",
	base0B = "#F1FA8C",
	base0C = "#8BE9FD",
	base0D = "#50fA7B",
	base0E = "#FF86D3",
	base0F = "#F8F8F2",
}

M.base_30 = {
	white = "#f8f8f2", -- current tab and line fg
	white2 = "#e9e9f4",
	darker_black = "#150525", -- nvim-tree bg
	black = "#170238", -- current tab bg
	black2 = "#282a36", -- tabline
	one_bg = "#3a3c46", -- cmd window
	one_bg2 = "#34175b", -- indenting context
	one_bg3 = "#442b6f", -- theme toggle button
	grey = "#563781", -- number of lines
	grey_fg = "#bd93f9", -- nvim tree arrows
	grey_fg2 = "#563781", -- comments
	light_grey = "#bdbdf9", -- tabs
	red = "#ff5555",
	orange = "#ffb86c",
	yellow = "#f1fa8c",
	pink = "#ff79c6",
	purple = "#bd93f9",
	green = "#50fa7b",
	cyan = "#8be9fd",
	teal = "#34bfa4",
	blue = "#6699cc",

	baby_pink = "#ff8e78",
	green1 = "#6ff4ac",
	vibrant_green = "#9be75b",
	nord_blue = "#a1bce1",
	sun = "#ffd392",
	dark_purple = "#4c1b5c",
	line = "#44475a", -- indenting line
	statusline_bg = "#2b2b3b", -- status bar
	lightbg = "#4c1b5c", -- path in status line
	pmenu_bg = "#bd85eb",
	folder_bg = "#bd93f9",
}

M.polish_hl = {
	["@parameter"] = { fg = M.base_30.cyan },
	["@keyword"] = { fg = M.base_30.white },
	["@variable"] = { fg = M.base_30.blue },
	["@field.key"] = { fg = M.base_30.pink },
	["@keyword.return"] = { fg = M.base_30.yellow },
	["@string"] = { fg = M.base_30.green },
}

M.type = "dark"

--M = require("base46").override_theme(M, "vscode")

return M
