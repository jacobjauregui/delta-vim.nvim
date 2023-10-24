local nvimtree = require("nvim-tree")

local M = {}

M.is_tree_open = false

M.load_tree = function()
	vim.cmd('NvimTreeOpen')
	local ft = vim.bo.filetype
	if ft == 'NvimTree' then
		vim.cmd('bnext')
		M.is_tree_open = true
	end
end

M.close_tree = function()
	local tabs = vim.api.nvim_list_tabpages()
	print(tabs)
	--local buffers = vim.api.nvim_list_buffers()
	--print(buffers .. M.is_tree_open)
	--vim.cmd('NvimTreeClose')
end

M.close_tree()


M.load_colorizer = function()
	vim.cmd('ColorizerAttachToBuffer')
end

return M
