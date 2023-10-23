local M = {}


M.message = {
	[[
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	░░░░██████╗░███████╗██╗░░████████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗░░░░
	░░░░██╔══██╗██╔════╝██║░░╚══██╔══╝██╔══██╗██║░░░██║██║████╗░████║░░░░
	░░░░██║░░██║█████╗░░██║░░░░░██║░░░███████║╚██╗░██╔╝██║██╔████╔██║░░░░
	░░░░██║░░██║██╔══╝░░██║░░░░░██║░░░██╔══██║░╚████╔╝░██║██║╚██╔╝██║░░░░
	░░░░██████╔╝███████╗███████╗██║░░░██║░░██║░░╚██╔╝░░██║██║░╚═╝░██║░░░░
	░░░░╚═════╝░╚══════╝╚══════╝╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░░░░
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
	]]
}


local buf = vim.api.nvim_create_buf(false, true)

function M.show_message()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, M.message)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "filetype", "delta")
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "readonly", true)
	vim.api.nvim_buf_set_option(buf, "swapfile", false)
	vim.api.nvim_buf_set_option(buf, "wrap", false)
	vim.api.nvim_buf_set_option(buf, "number", true)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "undolevels", -1)
	vim.api.nvim_buf_set_option(buf, "relativenumber", false)
	vim.api.nvim_buf_set_option(buf, "signcolumn", "no")
	vim.api.nvim_buf_set_option(buf, "colorcolumn", "")
	vim.api.nvim_buf_set_option(buf, "conceallevel", 0)
	vim.api.nvim_buf_set_option(buf, "concealcursor", "")
	vim.api.nvim_buf_set_option(buf, "cursorline", false)
	vim.api.nvim_buf_set_option(buf, "cursorcolumn", false)
	vim.api.nvim_buf_set_option(buf, "foldenable", false)
	vim.api.nvim_buf_set_option(buf, "foldmethod", "manual")
	vim.api.nvim_buf_set_option(buf, "foldlevel", 0)
	vim.api.nvim_buf_set_option(buf, "foldcolumn", "0")
	vim.api.nvim_buf_set_option(buf, "list", false)
	vim.api.nvim_buf_set_option(buf, "listchars", "")
	vim.api.nvim_buf_set_option(buf, "scrolloff", 0)
	vim.api.nvim_buf_set_option(buf, "sidescrolloff", 0)
	vim.api.nvim_buf_set_option(buf, "tabstop", 4)
	vim.api.nvim_buf_set_option(buf, "softtabstop", 4)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = 80,
		height = 20,
		row = 1,
		col = 1,
		style = "minimal",
		border = "single",
	})
	return win

end



return M
