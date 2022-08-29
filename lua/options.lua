local opt = vim.opt
-- >>>

-- Settings <<<
-- General <<<
opt.compatible = false
opt.belloff = "all"
opt.clipboard:append("unnamed,unnamedplus")
opt.encoding = "utf-8"
opt.errorbells = false
opt.visualbell = false
opt.title = true
opt.shell = "/bin/bash"
opt.path:append "**"
opt.lazyredraw = true
opt.mouse:append "niv"
opt.mousemodel = "popup_setpos"
opt.confirm = false
opt.hidden = true
opt.magic = true
opt.spell = true
opt.spelllang = "en"
opt.autoread = true
opt.dictionary = "spell"
opt.backspace:append "indent,eol,start"
opt.showmode = false
opt.showcmd = true
opt.modeline = true
opt.shortmess:append "sI"
-- >>>
-- Backup, Swap and Undo <<<
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('cache') .. '/undo'
opt.undolevels = 1000
opt.history = 1000
opt.directory = vim.fn.stdpath('cache') .. '/swap'
-- >>>
-- UI <<<
opt.termguicolors = true
opt.syntax = "on"
opt.background = "dark"
opt.cursorline = true
opt.cursorcolumn = false
opt.list = true
opt.listchars:append "tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
opt.wrap = false
opt.showmatch = true
opt.laststatus = 2
opt.ruler = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
-- >>>
-- Indents and tabs <<<
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
-- >>>
-- Folds <<<
opt.fillchars = "vert:|,fold:-"
opt.foldmarker = "<<<,>>>"
opt.foldmethod = "marker"
-- >>>
-- Wildmenu <<<
opt.wildmenu = true
opt.wildmode = "full"
opt.wildignorecase = true
opt.wildignore:append ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
-- >>>
-- Autocompletion <<<
opt.complete = ".,w,b,k"
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append "Aac"
-- >>>
-- Search and Highlight <<<
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
-- >>>
-- Others <<<
opt.formatoptions:remove('ro')
opt.diffopt = "vertical,filler"
if opt.diff:get() then
  opt.cursorbind = true
  opt.scrollbind = true
else
  opt.cursorbind = false
  opt.scrollbind = false
end
-- >>>
-- >>>
