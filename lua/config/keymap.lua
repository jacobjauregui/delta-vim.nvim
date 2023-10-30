-- Keymaps for DeltaVim Nov/2023
local M = {}

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)

local n = 'n' -- Nomral
local i = 'i' -- Insert
local v = 'v' -- Visual
local x = 'x' -- V-Block
local c = 'c' -- Command
local t = 't' -- Terminal

local map = vim.keymap.set

M.changeModes = {
	map({ i, v, x, c }, '<A-n>', '<ESC>', { desc = 'Exit current mode' }),
	map(n, 'a', 'i', { desc = 'Change to Insert mode right' }),
	map(n, 'h', 'a', { desc = 'Change to Insert mode left' }),
	map(n, 'm', 'o', { desc = 'Change to Insert mode below' }),
	map(n, 'o', '<S-o>', { desc = 'Change to Insert above' }),
	map(n, ';', ':', { desc = 'Change to Command mode' }),
	map(n, '<leader>v', '<C-v>', { desc = 'Change to V-Block mode' }),
}

-- NORMAL MODE
M.modeNormal = {
	map(n, ',', '<<', { desc = 'Remove indentation in Normal mode' }),
	map(n, '.', '>>', { desc = 'Indent line in Normal mode' }),
	map(n, '<C-c>', '<cmd> $y+ <CR>', { desc = 'Copy whole file' }),
	map(n, '<C-e>', 'ggVG', { desc = 'Select all' }),
	map(n, '<leader>q', '<cmd> wq <CR>', { desc = 'Save and quit' }),
	map(n, '<leader>s', '<cmd> w <CR>', { desc = 'Save file' }),
	map(n, '<leader>z', '<cmd> q! <CR>', { desc = 'Quit without save' }),
	map(n, '<ESC>', '<cmd> noh <CR>', { desc = 'no highlight' }),
	map(n, '<F5>', function()
		local ft = vim.bo.filetype
		local fn = vim.fn.expand('%:t')
		vim.notify = require('notify')
		if ft == 'lua' or ft == 'python' then
			vim.notify('running... ' .. fn .. ' file.', 'info', { title = 'Running code' })
			vim.cmd('term ' .. ft .. ' %')
		else
			vim.notify('Error to save. ' .. fn .. ' file not is running.', 'error', { title = 'Running code' })
		end
	end, { desc = 'Run code' }),
	map(n, '<F4>', function()
		vim.notify = require('notify')
		local ft = vim.bo.filetype
		local fn = vim.fn.expand('%:t')
		if ft == 'markdown' then
			vim.notify(fn .. ' preview... ', 'info', { title = 'Markdown Preview' })
			return '<cmd> MarkdownPreviewToggle <CR>'
		else
			vim.notify('File ' .. fn .. ' is not a compatible file, please try again with .md files',
				'error', { title = 'Markdown Preview' })
		end
	end, { desc = 'Show Markdown preview (for files foo.md)' }),
}


-- INSERT MODE
M.modeInsert = {
	map({ c, i }, '<A-j>', '<Left>', { desc = 'Move left when typing' }),
	map({ c, i }, '<A-l>', '<Right>', { desc = 'Move right when typing' }),
	map({ c, i }, '<A-J>', '<Home>', { desc = 'Go to begginning of line when typing' }),
	map({ c, i }, '<A-L>', '<End>', { desc = 'Go to end of line when typing' }),
	map(i, '<A-i>', '<Up>', { desc = 'Move up in Insert mode' }),
	map(i, '<A-k>', '<Down>', { desc = 'Move down in Insert mode' }),
	map(i, '<A-u>', '<Delete>', { desc = 'Remove next-char' }),
	map(i, '<A-h>', '<Backspace>', { desc = 'Remove prev-char' }),
	map(i, '<leader><Space>', '<Tab>', { desc = 'Indent line' }),
	map(i, '<S-TAB>', '<Backspace>', { desc = 'Undo indent line' }),
}

-- V-BLOCK MODE
M.modeVisualBlock = {
	map(x, ',', '<', { desc = 'delete indentation within visual mode' }),
	map(x, '.', '>', { desc = 'indent line within visual mode' }),
}

-- COMMAND MODE
M.modeCommand = {
	map(c, '<A-i>', '<Up>', { desc = 'Type the last command in cmd history in Command mode' }),
}

-- TERMINAL MODE
M.modeTerminal = {
	map({ t }, '<C-x>', termcodes '<C-\\><C-N>', { desc = 'Escape terminal mode' }),
	--	map({n}, '<C-x>', '<cmd> :bdelete <CR>', { desc = 'Exit mode terminal' }),
}

M.navigation = {
	-- Cursor movements
	map({ n, v, x }, 'i', '<Up>', { desc = 'Move up' }),
	map({ n, v, x }, 'j', '<Left>', { desc = 'Move left' }),
	map({ n, v, x }, 'l', '<Right>', { desc = 'Move right' }),
	map({ n, v, x }, 'k', '<Down>', { desc = 'Move down' }),
	map({ n, v, x }, '<leader>i', 'gg', { desc = 'Go to the first line' }),
	map({ n, v, x }, '<leader>j', '<Home>', { desc = 'Go to start of the current line' }),
	map({ n, v, x }, '<leader>l', '<End>', { desc = 'Go to end of the current line' }),
	map({ n, v, x }, '<leader>k', 'G', { desc = 'Go to the last line' }),
	-- tabs, buffers and windows
	map(n, '<leader>b', '<cmd> tabnew <CR>', { desc = 'Open new tab' }),
	map(n, '<TAB>', '<cmd> tabnext <CR>', { desc = 'Go to next tab' }),
	map(n, '<S-TAB>', '<cmd> tabprevious <CR>', { desc = 'Go to previous tab' }),
	map(n, '<leader>x', '<cmd> tabclose <CR>', { desc = 'Close current tab' }),
	map(n, '<leader>1', ' <cmd> tabfirst <CR>', { desc = 'Go to first tab' }),
	map(n, '<leader>0', ' <cmd> tablast <CR>', { desc = 'Go to last tab' }),
	map(n, '<C-v>', '<cmd> :vsplit <CR> <cmd> :enew <CR>', { desc = 'Split window vertical' }),
	map(n, '<C-h>', '<cmd> :split <CR> <cmd> :enew <CR>', { desc = 'Split window horizontal' }),
	map(n, '<C-k>', '<C-w>j', { desc = 'Go to window down' }),
	map(n, '<C-i>', '<C-w>k', { desc = 'Go to whindow up' }),
	map(n, '<C-j>', '<C-w>h', { desc = 'Go to window lef' }),
	map(n, '<C-l>', '<C-w>l', { desc = 'Go to window right' }),
	map(n, '<C-x>', '<cmd> :bdelete <CR>', { desc = 'Close current buffer' }),
	map(n, '<C-Up>', '<cmd> :resize -2 <CR>', { desc = 'Resize window down' }),
	map(n, '<C-Down>', '<cmd> :resize +2 <CR>', { desc = 'Resize window up' }),
	map(n, '<C-Right>', '<cmd> :vertical resize -2 <CR>', { desc = 'Resize window left' }),
	map(n, '<C-Left>', '<cmd> :vertical resize +2 <CR>', { desc = 'Resize window right' }),
}

M.comment = {
	map(n, '<leader>/', function()
		require('Comment.api').toggle.linewise.current()
	end, { desc = 'toggle comment' }),
	map(v, '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
		{ desc = 'toggle comment' }),
	map(x, '<leader>\\', function()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		require('Comment.api').toggle.blockwise(vim.fn.visualmode())
	end, { desc = 'toggle blockwise comment' })
}

--M.lspconfig = {
--map(n, 'D', function() vim.lsp.buf.declaration() end, { desc = 'lsp declaration' }),
--map(n, '<leader>de', function() vim.lsp.buf.definition() end, {desc = 'lsp definition' }),
--map(n, 'K', function() vim.lsp.buf.hover() end, { desc = 'lsp hover' }),
--map(n, '<leader>im', function() vim.lsp.buf.implementation() end, { desc = 'lsp implementation' }),
--map(n, '<leader>si', function() vim.lsp.buf.signature_help() end, { desc = 'lsp signature_help }),
--map(n, 'T', function() vim.lsp.buf.type_definition() end, { desc = 'lsp definition type' }),
--map(n, 'R', function() vim.lsp.buf.rename end, { desc = 'lsp rename' }),
--['<leader>co'] = {
--    function()
--        vim.lsp.buf.code_action()
--    end,
--    "lsp code_action",
--['<leader>re'] = {
--    function()
--        vim.lsp.buf.references()
--    end,
--    "lsp references",
--['<leader>od'] = {
--    function()
--        vim.diagnostic.open_float()
--    end,
--    "floating diagnostic"
--['<C-[>' = {
--    function()
--        vim.diagnostic.goto_prev()
--    end,
--    "goto prev",
--['<C-]>' = {
--    function()
--        vim.diagnostic.goto_next()
--    end,
--    "goto next",
--["<leader>fo"] = {
--    function()
--        vim.lsp.buf.format { async = true }
--    end,
--    "lsp formatting",
--["<leader>aw"] = {
--    function()
--        vim.lsp.buf.add_workspace_folder()
--    end,
--    "add workspace folder",
--["<leader>rw"] = {
--    function()
--        vim.lsp.buf.remove_workspace_folder()
--    end,
--    "remove workspace",
--["<leader>wl"] = {
--    function()
--        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end,
--    "list workspace folders",
--}


M.tree_and_telescope = {
	map({ n, i, c, v }, '<F1>', '<cmd> Telescope help_tags <CR>', { desc = 'help page' }),
	map({ n, i, c, v }, '<F3>', '<cmd> Telescope find_files <CR>', { desc = 'find files' }),
	map({ n, i, c, v }, '<F2>', '<cmd> NvimTreeToggle <CR>', { desc = 'toggle nvimtree' }),
	--map(modes.n, '<F3>', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', { desc = 'find all' }),
	--map(modes.n, '<leader>fw', '<cmd> Telescope live_grep <CR>', 'live grep'),
	--map(modes.n, '<leader>fb', '<cmd> Telescope buffers <CR>', 'find buffers'),
	--map(modes.n, '<leader>gc', '<cmd> Telescope git_commits <CR>', 'git commits'),
	--map(modes.n, '<leader>st', '<cmd> Telescope git_status <CR>', 'git status'),
	--map(modes.n, '<leader>pt', '<cmd> Telescope terms <CR>', 'pick hidden term'),
}

--M.nvterm = {
--map(t, '<A-t>', function()
--equire('nvterm.terminal').toggle 'float'
--end, { desc = 'Toggle floating term' }),
--map(modes.t, '<A-g>', function()
--require('nvterm.terminal').toggle 'horizontal'
--end, 'toggle horizontal term'),
--map(modes.t, '<A-v>', function()
--require('nvterm.terminal').toggle 'vertical'
--end, 'toggle vertical term'),
--map(modes.n, '<A-t>', function()
--require('nvterm.terminal').toggle 'float'
--end, 'toggle floating term'),
--map(modes.n, '<A-g>', function()
--require('nvterm.terminal').toggle 'horizontal'
--end, 'toggle horizontal term'),
--map(modes.n, '<A-v>', function()
--require('nvterm.terminal').toggle 'vertical'
--end, 'toggle vertical term'),
--map(modes.n, '<leader>h', function()
--require('nvterm.terminal').new 'horizontal'
--end, 'new horizontal term'),
--map(modes.n, '<leader>v', function()
--require('nvterm.terminal').new 'vertical'
--end, 'new vertical term'),
--}

--M.cmp = {
--	map(i, '<C-CR>', function()
--		require('cmp').complete()
--	end, 'cmp complete'),
--	map(i, '<ESC><ESC>' function()
--		require('cmp').close()
--	end, 'cmp close'),
--	map(modes.i, '<C-u>', function()
--		require('cmp').scroll { delta = 4 }
--	end, 'cmp scroll down'),
--	map(i, '<C-o>', function()
--		require('cmp').scroll { delta = -4 }
--	end, 'cmp scroll up'),
--}

return M
