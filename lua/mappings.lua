-- map key function
local function map(mode, lhs, rhs, opts)
  local options = opts or {}
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mappings <<<
vim.g.mapleader = " "
-- Search <<<
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*N')
map('n', '#', '#N')
-- >>>
-- Quickfix and Location list <<<
map('n', '<leader>q',   '<Cmd>silent! lua ToggleQuickFix()<CR>')
map('n', '[q',          '<Cmd>cprev<CR>zz')
map('n', ']q',          '<Cmd>cnext<CR>zz')
map('n', '<leader>w',   '<Cmd>silent! lua ToggleLocList()<CR>')
map('n', '[w',          '<Cmd>lprev<CR>zz')
map('n', ']w',          '<Cmd>lnext<CR>zz')
map('n', '[W',          '<Cmd>silent! lolder<CR>zz')
map('n', ']W',          '<Cmd>silent! lnewer<CR>zz')
-- >>>
-- Buffers and Tabs <<<
map('n', '<leader>b',   '<Cmd>lua BuffersMenu()<CR>')
map('n', '[b',          '<Cmd>bprev<CR>')
map('n', ']b',          '<Cmd>bnext<CR>')
map('n', '<leader>B',   '<Cmd>lua TabsMenu()<CR>')
map('n', '[B',          '<Cmd>tabprev<CR>')
map('n', ']B',          '<Cmd>tabnext<CR>')
-- >>>
-- Vimrc <<<
map('n', '<leader>e',   '<Cmd>edit $MYVIMRC<CR>')
map('n', '<leader>E',   '<Cmd>source $MYVIMRC<CR>')
-- >>>
-- move lines by tab width in visual mode <<<
map('v', '>', '>gv')
map('v', '<', '<gv')
-- >>>
-- Moving cursor <<<
map('i', '<C-k>', '<UP>')
map('i', '<C-j>', '<DOWN>')
map('i', '<C-h>', '<LEFT>')
map('i', '<C-l>', '<RIGHT>')
map('n', 'J',     '}<Enter>0')
map('n', 'K',     '{<BS>0')
map('v', 'J',     '}<Enter>0')
map('v', 'K',     '{<BS>0')
map('n', 'H',     '<Cmd>silent! lua JumpToStartOfLine()<CR>')
map('n', 'L',     '<Cmd>silent! lua JumpToEndOfLine()<CR>')
map('n', 'W',     'e')
map('n', 'B',     'ge')
-- >>>
-- Shift lines <<<
map('n', '<C-Up>',    ':m-2<CR>==')
map('n', '<C-Down>',  ':m+<CR>==')
map('v', '<C-Up>',    ':m-2<CR>gv=gv')
map('v', '<C-Down>',  ":m'>+<CR>gv=gv")
-- >>>
-- Marks <<<
map('n', 'mn', ']`zz')
map('n', 'mN', '[`zz')
map('n', 'mm', 'g`zz')
-- >>>
-- >>>
