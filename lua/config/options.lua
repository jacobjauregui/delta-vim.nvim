local opt = vim.opt
local g = vim.g

g.mapleader = " "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

------------------------------------ OPTIONS ----------------------------------
opt.autowrite = true
opt.autoread = true
opt.browsedir = 'buffer'
opt.encoding = 'utf-8'
opt.clipboard = 'unnamedplus'
opt.hidden = true --Don't unload buffer when it's abandoned.
opt.wrap = false
opt.swapfile = false
--opt.undofile = true
--opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
--------------------------------- SPELLING ------------------------------------
-- opt.spell = false
-- opt.spellcapcheck = ""
-- opt.spellfile = {os.getenv "HOME" .. "/.config/nvim/spell/en.utf-8.add"}
-- opt.spelllang = "en"
-- opt.spelloptions = "camel"
-- opt.spellsuggest = "best"
--------------------- COLUMNS, LINES AND INDENTING ----------------------------
opt.number = true
opt.numberwidth = 4
opt.relativenumber = false
opt.colorcolumn = "80"
-- opt.columns = 149
-- opt.lines = 31
-- opt.linespace = 0
--opt.cursorcolumn = false
opt.cursorline = true
opt.cursorlineopt = "both" -- "number, line, screenline, both"
opt.signcolumn = "yes"
opt.autoindent = true
opt.breakindent = false
--opt.breakindentopt = "shift:2"
opt.expandtab = false -- Use spaces instead <TAB>
--opt.startofline = true -- When moving cursor to another line, position it on the first non-blank character.
opt.smarttab = false -- Use shiftwidth instead tabstop when inserting <TAB>.
--opt.shiftround = true -- Round indent to multiple of 'shiftwidth'.
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
opt.tabstop = 4 -- Number of spaces that <TAB> in file uses for indent.
opt.softtabstop = 4 --Number of spaces that <TAB> uses while editing.
--opt.linebreak = true -- Wrap long lines at a blank character.
--opt.showbreak = '↳ ' --String to use at the start of wrapped lines.
opt.smartindent = true --Samart indenting for C-like languages.
------------------------------ UI -------------------------------------
opt.mouse = 'a' -- Enable mouse support.
opt.mousehide = true -- Hide mouse pointer when typing.
opt.fixendofline = true -- Make sure last line in file has <EOL>.
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.list = true
opt.listchars = { tab = '│ ', trail = ' ' } --│║-··
--opt.listchars:append({ eol = '↵' })

opt.fillchars = { -- Character to use for display special items.
	stl = ' ', -- Statusline
	stlnc = ' ', -- Statusline no current
	wbr = ' ', -- WinBar
	horiz = '─',--󱁧
	horizdown = '┬',
	vert = '│', --󱁨
	vertleft = '┤',
	vertright = '├',
	verthoriz = '┼',
	horizup = '┴',
	fold = ' ', -- ·
	foldclose = '󱁧', --,▸
	foldopen = '󱁨', --▾
	foldsep = '', --⋮┃│
	diff = '-', --░,⣿,-,─,󱁦
	msgsep = '‾', -- ─,⋮
	lastline = '‾',
	eob = ' ', -- End of buffer
}
opt.timeoutlen = 200
opt.updatetime = 150
opt.shortmess = "filnxtToOF"
opt.showmatch = true
opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
-- opt.wichwrap:append '<>[]hl'
-- opt.guifont = {'VictorMonoNerdFont-Regular', 'h12'}

----------------------------- FOLDING -----------------------------------------
opt.foldenable = true
opt.foldcolumn = "auto:9" --0, auto, auto:1-9, 1-9 resize the width of the fold column
opt.foldminlines = 4
opt.foldnestmax = 9
opt.foldmethod = "indent" -- "manual", "expr", "indent", "syntax", "diff", "marker"
opt.foldignore = "comment" --only used when foldmethod=indent
opt.foldlevel = 3 -- 0-99
--opt.foldopen = "all"
opt.foldclose = "all" --'all'
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- Used when foldmethod=expr.
-- opt.foldmarker = '{{{,}}}' -- when foldmethod=marker
opt.foldtext = "... "
--"v:lua.fold_text() 
-- function MyFoldText()
--    local line = getline(v:foldstart)
--    local sub = substitute(line, '/\*\|\*\|{{{\d\=', '', 'g')/*|*/|{{{ d = g
------------ WINDOWS, STATUSLINE AND TABLINE ----------------------------------
opt.cmdheight = 1
opt.cmdwinheight = 7
opt.laststatus = 3
opt.showcmd = false
opt.showmode = false
-- opt.ruler = true
-- opt.rulerformat = "Ln %l - Col %c"
--opt.statusline = "(%f%)%=%y%=%-(Ln %l/%L | Col %c%V %)"
--------------------------------- TABLINE -------------------------------------
-- opt.tabline = "%=(%T%n%y%t%T%)%=(%999Xclose%X)"
opt.showtabline = 0 -- 0 = never, 1 = only if are at least two tabs, 2 = always
----------------------------- WINDOW ---------------------------------
opt.equalalways = false
opt.title = true
opt.titlelen = 95
opt.titlestring = "󰕣  DeltaVim"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
-- opt.window = 1080
-- opt.winheight = 40
-- opt.winwidth = 180
-- opt.winfixheight = true
-- opt.winfixwidth = true
-- opt.winminheight = 20
-- opt.winminwidth = 90
-- opt.wrapmargin = " "
