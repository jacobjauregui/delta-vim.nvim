local opt = vim.opt
local g = vim.g

g.mapleader = " "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

------------------------------------ OPTIONS ----------------------------------
opt.autowrite = true
--opt.browsedir = 'last'
--opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.hidden = true --Don't unload buffer when it's abandoned.
opt.wrap = true
opt.swapfile = false
--opt.undofile = true
--opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
--------------------------------- SPELLING ---------------------------------------
-- opt.spell = false
-- opt.spellcapcheck = ""
-- opt.spellfile = {os.getenv "HOME" .. "/.config/nvim/spell/en.utf-8.add"}
-- opt.spelllang = "en"
-- opt.spelloptions = "camel"
-- opt.spellsuggest = "best"
--------------------- COLUMNS, LINES AND INDENTING ----------------------------
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
-- opt.columns = 149
-- opt.lines = 31
opt.colorcolumn = "80"
-- opt.linespace = 0
--opt.cursorcolumn = false
opt.cursorline = true
opt.cursorlineopt = "both" -- "number, line, screenline, both"
opt.signcolumn = "yes"
opt.autoindent = true
opt.breakindent = false
--opt.breakindentopt = "shift:2"
opt.expandtab = true --use spaces instead <TAB>
opt.startofline = true
opt.smarttab = true --Use shiftwidth instead tabstop when inserting <TAB>.
-- opt.shiftround = false --Round indent to multiple of 'shiftwidth'.
opt.shiftwidth = 4 --Number of spaces to use for each step of (auto)indent.
opt.tabstop = 4 --Number of spaces that <TAB> in file uses for indent.
opt.softtabstop = 4 --Number of spaces that <TAB> uses while editing.
--opt.linebreak = true --Wrap long lines at a blank character.
--opt.showbreak = '↳ ' --String to use at the start of wrapped lines.
opt.smartindent = true --Samart indenting for C-like languages.

------------------------------ UI -------------------------------------
opt.mouse = "a"
opt.mousehide = true --Hide mouse pointer when typing.
--opt.fillchars = "eob: " -- Character to use for display special items.
--opt.fixendofline = true --Make sure last line in file has <EOL>.
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.termguicolors = true
opt.list = true
opt.listchars = "tab:║ ,trail:·" ---
opt.timeoutlen = 400
opt.updatetime = 250
opt.shortmess = "filnxtToOFWIcC"
opt.showmatch = true
--opt.wichwrap:append '<>[]hl'
-- opt.guifont = "VictorMonoNerdFont-Regular"
-- opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

----------------------------- FOLDING -----------------------------------------
-- opt.foldclose = "all"
-- opt.foldcolumn = "1"
-- opt.foldenable = false
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldignore = "comment"
-- opt.foldlevel = 0
-- opt.foldopen = "all"
-- opt.foldmarker = '{{{,}}}'
-- opt.foldmethod = "indent"
-- opt.foldminlines = 1
-- opt.foldnestmax = 10
--opt.foldtext = "v:lua.fold_text()"
----------------------------- STATUSLINE --------------------------------------
opt.cmdheight = 1
opt.cmdwinheight = 7
opt.laststatus = 3
opt.showcmd = false
opt.showmode = false
-- opt.ruler = true
-- opt.rulerformat = "Ln %l - Col %c"
--opt.statusline = "(%f%)%=%y%=%-(Ln %l/%L | Col %c%V %)"
----------------------------------------------------- TABLINE ------------------------------------------------------------------------------
-- opt.tabline = "%=(%T%n%y%t%T%)%=(%999Xclose%X)"
opt.showtabline = 2 -- 0 = never, 1 = only if are at least two tabs, 2 = always

----------------------------- WINDOW AND TABS ---------------------------------
opt.equalalways = false
opt.title = true
opt.titlelen = 95
opt.titlestring = "󰕣  DeltaVim" --󰇂󰔶
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
