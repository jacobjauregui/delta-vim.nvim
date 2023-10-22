local M = {}

M.save_and_exec = function()
	local src_cmd = {
		lua = "luafile %",
		vim = "source &",
	}
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	local cmd = src_cmd[ft]
	if cmd == nil then
		print("No command for filetype: " .. ft)
		return
	end
	vim.api.nvim_command("silent w")
	vim.api.nvim_command(cmd)

	local current_filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
	print("File %s Sourced", current_filename)
end


return M
