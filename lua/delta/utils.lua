local nvimtree = require("nvim-tree")

local M = {}

M.load_tree = function()
	vim.cmd('NvimTreeOpen')
	local ft = vim.bo.filetype
	local message = 'NvimTree loaded in tab ' .. ft .. ' '
	if ft == 'NvimTree' then
		message = 'NvimTree already loaded in tab ' .. ft .. ' '
		vim.cmd('bnext')
	end
	vim.notify = require("notify")
	vim.notify(message, 'info', {title = 'NVTree', timeout = 2000, icon = ''})
end

M.load_colorizer = function()
	vim.cmd('ColorizerAttachToBuffer')
end

return M
