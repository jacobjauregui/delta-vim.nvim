-- Keymaps for nvim oct/2023
local M = {}

local map = vim.keymap.set
local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)
local modes = {
	n = 'n', -- Nomral
	i = 'i', -- Insert
	v = 'v', -- Visual
	x = 'x', -- V-Block
	c = 'c', -- Command
	t = 't', -- Terminal
}

local n = modes.n
local i = modes.i
local v = modes.v
local x = modes.x
local c = modes.c
local t = modes.t

M.changeModes = {
	map({i,v,x,c}, '<A-n>', '<ESC>', { desc = 'Exit current mode' }),
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
	map(n, '<F6>', function()
		local ft = vim.bo.filetype
		if ft == 'python' then
			print('python file run... ' .. ft)
			return '<cmd> w <CR> <cmd> !python3 % <CR>'
		elseif ft == 'lua' then
			print('lua file %s run... ' .. ft)
			return '<cmd> w <CR> <cmd> luafile % <CR>'
		else
			print('file ' .. ft .. ' saved.')
			return '<cmd> w <CR>'
		end
	end, { desc = 'Run code' }),
	map(n, '<F5>', '<cmd> w <CR> <cmd> luafile % <CR>', { desc = 'Save and run (for lua files)' }),
    map(n, '<C-p>', '<cmd> MarkdownPreview <CR>', { desc = 'Markdown preview' }),
    map(n, '<F4>', '<cmd> MarkdownPreviewToggle <CR>', { desc = 'Markdown preview toggle' }),
}


-- INSERT MODE
M.modeInsert = {
	map({c,i}, '<A-j>', '<Left>', { desc = 'Move left when typing' }),
	map({c,i}, '<A-l>', '<Right>', { desc = 'Move right when typing' }),
	map({c,i}, '<A-J>', '<Home>', { desc = 'Go to begginning of line when typing' }),
	map({c,i}, '<A-L>', '<End>', { desc = 'Go to end of line when typing' }),
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
	map(t, '<C-x>', termcodes '<C-\\><C-N>', { desc = 'escape terminal mode' }),
}

M.navigation = {
-- Cursor movements
	map({n,v,x}, 'i', '<Up>', { desc = 'Move up' }),
	map({n,v,x}, 'j', '<Left>', { desc = 'Move left' }),
	map({n,v,x}, 'l', '<Right>', { desc = 'Move right' }),
	map({n,v,x}, 'k', '<Down>', { desc = 'Move down' }),
	map({n,v,x}, '<leader>i', 'gg', { desc = 'Go to the first line' }),
	map({n,v,x}, '<leader>j', '<Home>', { desc = 'Go to start of the current line' }),
	map({n,v,x}, '<leader>l', '<End>', { desc = 'Go to end of the current line' }),
	map({n,v,x}, '<leader>k', 'G', { desc = 'Go to the last line' }),
-- tabs, buffers and windows
	map(n, '<leader>b', '<cmd> tabnew <CR>', { desc = 'Open new tab' }),
	map(n, '<TAB>', '<cmd> tabnext <CR>', { desc = 'Go to next tab' }),
	map(n, '<S-TAB>', '<cmd> tabprevious <CR>', { desc = 'Go to previous tab' }),
	map(n, '<leader>x', '<cmd> tabclose <CR>', { desc = 'Close current tab' }),
	map(n, '<leader>1', ' <cmd> tabfirst <CR>', { desc = 'Go to first tab' }),
	map(n, '<leader>0', ' <cmd> tablast <CR>', { desc = 'Go to last tab' }),
	map(n, '<C-i>', '<C-w>k', { desc = 'Go to whindow up' }),
	map(n, '<C-j>', '<C-w>h', { desc = 'Go to window lef' }),
	map(n, '<C-l>', '<C-w>l', { desc = 'Go to window right' }),
	map(n, '<C-k>', '<C-w>j', { desc = 'Go to window down' }),
}

M.comment = {
	map(n, '<leader>/', function()
		require('Comment.api').toggle.linewise.current()
	end, { desc = 'toggle comment' }),
	map(v, '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'toggle comment' }),
	map(x, '<leader>\\', function()
		vim.api.nvim_feedkeys(esc,'nx', false)
		require('Comment.api').toggle.blockwise(vim.fn.visualmode())
		end, { desc = 'toggle blockwise comment' })
}

--M.lspconfig = {
--    n = {
--        ["gD"] = {
--            function()
--                vim.lsp.buf.declaration()
--            end,
--            "lsp declaration",
--        },
--        ["gd"] = {
--            function()
--                vim.lsp.buf.definition()
--            end,
--            "lsp definition",
--        },
--        ["FF"] = {
--            function()
--                vim.lsp.buf.hover()
--            end,
--            "lsp hover",
--        },
--        ["gi"] = {
--            function()
--                vim.lsp.buf.implementation()
--            end,
--            "lsp implementation",
--        },
--        ["<leader>ff"] = {
--            function()
--                vim.lsp.buf.signature_help()
--            end,
--            "lsp signature_help",
--        },
--        ["<leader>D"] = {
--            function()
--                vim.lsp.buf.type_definition()
--            end,
--            "lsp definition type",
--        },
--        ["<leader>ra"] = {
--            function()
--                require("nvchad_ui.renamer").open()
--            end,
--            "lsp rename",
--        },
--        ["<leader>ca"] = {
--            function()
--                vim.lsp.buf.code_action()
--            end,
--            "lsp code_action",
--        },
--        ["gr"] = {
--            function()
--                vim.lsp.buf.references()
--            end,
--            "lsp references",
--        },
--        ["<leader>f"] = {
--            function()
--                vim.diagnostic.open_float()
--            end,
--            "floating diagnostic"
--        },
--        ["[d"] = {
--            function()
--                vim.diagnostic.goto_prev()
--            end,
--            "goto prev",
--        },
--        ["d]"] = {
--            function()
--                vim.diagnostic.goto_next()
--            end,
--            "goto next",
--        },
--        ["<leader>fm"] = {
--            function()
--                vim.lsp.buf.format { async = true }
--            end,
--            "lsp formatting",
--        },
--        ["<leader>wa"] = {
--            function()
--                vim.lsp.buf.add_workspace_folder()
--            end,
--            "add workspace folder",
--        },
--        ["<leader>wr"] = {
--            function()
--                vim.lsp.buf.remove_workspace_folder()
--            end,
--            "remove workspace",
--        },
--        ["<leader>wl"] = {
--            function()
--                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--            end,
--            "list workspace folders",
--        },
--    },
--}

M.nvimtree = {
	map(n, '<F2>', '<cmd> NvimTreeToggle <CR>', { desc = 'toggle nvimtree' }),
	-- map(modes.n, '<leader>e', '<cmd> NvimTreeFocus <CR>', 'focus nvimtree'),
}

M.telescope = {
	map(n, '<F3>', '<cmd> Telescope find_files <CR>', { desc = 'find files' }),
	map(n, '<F1>', '<cmd> Telescope help_tags <CR>', { desc = 'help page' }),
--map(modes.n, '<F3>', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', { desc = 'find all' }),
--	map(modes.n, '<leader>fw', '<cmd> Telescope live_grep <CR>', 'live grep'),
--	map(modes.n, '<leader>fb', '<cmd> Telescope buffers <CR>', 'find buffers'),
--	map(modes.n, '<leader>fo', '<cmd> Telescope oldfiles <CR>', 'find oldfiles'),
--	map(modes.n, '<leader>fk', '<cmd> Telescope keymaps <CR>', 'show keys'),
--	map(modes.n, '<leader>gc', '<cmd> Telescope git_commits <CR>', 'git commits'),
--	map(modes.n, '<leader>st', '<cmd> Telescope git_status <CR>', 'git status'),
--	map(modes.n, '<leader>pt', '<cmd> Telescope terms <CR>', 'pick hidden term'),
--	map(modes.n, '<leader>th', '<cmd> Telescope themes <CR>', 'nvcahd themes'),
}

--M.nvterm = {
--	map(modes.t, '<A-t>', function()
--		require('nvterm.terminal').toggle 'float'
--	end, 'toggle floating term'),
--	map(modes.t, '<A-g>', function()
--		require('nvterm.terminal').toggle 'horizontal'
--	end, 'toggle horizontal term'),
--	map(modes.t, '<A-v>', function()
--		require('nvterm.terminal').toggle 'vertical'
--	end, 'toggle vertical term'),
--	map(modes.n, '<A-t>', function()
--		require('nvterm.terminal').toggle 'float'
--	end, 'toggle floating term'),
--	map(modes.n, '<A-g>', function()
--		require('nvterm.terminal').toggle 'horizontal'
--	end, 'toggle horizontal term'),
--	map(modes.n, '<A-v>', function()
--		require('nvterm.terminal').toggle 'vertical'
--	end, 'toggle vertical term'),
--	map(modes.n, '<leader>h', function()
--		require('nvterm.terminal').new 'horizontal'
--	end, 'new horizontal term'),
--	map(modes.n, '<leader>v', function()
--		require('nvterm.terminal').new 'vertical'
--	end, 'new vertical term'),
--}

--M.cmp = {
--	map(modes.i, '<C-Space>', function()
--		require('cmp').complete()
--	end, 'cmp complete'),
--	map(modes.i, '<ESC><ESC>' function()
--		require('cmp').close()
--	end, 'cmp close'),
--	map(modes.i, '<C-f>', function()
--		require('cmp').scroll { delta = 4 }
--	end, 'cmp scroll down'),
--	map(modes.i, '<C-d>', function()
--		require('cmp').scroll { delta = -4 }
--	end, 'cmp scroll up'),
--}

--M.whichkey = {
--	map(modes.n, '<leader>wK', function()
--		vim.cmd 'Whichkey'
--	end, 'Which-key all keymaps'),
--	map(modes.n, '<leader>wk', function()
--		local input = vim.fn.input 'whichkey: ' vim.cmd("Whichkey " .. input)
--	end, 'Which-key querty lookup'),
--}

--M.blankline = {
--	map(modes.n, '<leader>cc', function()
--		local ok, start = require('indent_blankline.utils').get_current_context(
--			vim.g.indent_blankline_context_patterns,
--			vim.g.indent_blankline_use_treesitter_scope)
--		if ok then
--			vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
--			vim.cmd [[normal! _]]
--		end
--	end, 'Jump to current_context'),
--}

--M.gitsigns = {
--	map(modes.n, ']c', function()
--		if vim.wo.diff then
--			return ']c'
--		end
--		vim.schedule(function()
--			require('gitsigns').next_hunk()
--		end)
--		return'<Ignore>'
--	end, 'Jump to next hunk', opts = { expr = true }),
--	map(modes.n, '[c', function()
--		if vim.wo.diff then
--			return '[c'
--		end
--		vim.schedule(function()
--			require('gitsigns').prev_hunk()
--		end)
--		return '<Ignore>'
--	end, 'Reset hunk'),
--	map(modes.n, '<leader>ph', function()
--		package.loaded.gitsigns.blame_line()
--	end, 'Toggle deleted'),
--}

return M
