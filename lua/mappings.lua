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
map('n', '<leader>a',   '<Cmd>enew<CR>')
map('n', '<leader>s',   '<Cmd>w!<CR>')
map('n', '<leader>d',   '<Cmd>bd!<CR>')
map('n', '<leader>b',   '<Cmd>b#<CR>')
map('n', '<leader>B',   '<Cmd>b <C-Z>')
map('n', '[b',          '<Cmd>bprev<CR>')
map('n', ']b',          '<Cmd>bnext<CR>')
map('n', '<leader>A',   '<Cmd>tabnew<CR>')
map('n', '<leader>D',   '<Cmd>tabclose<CR>')
map('n', '[c',          '<Cmd>tabprev<CR>')
map('n', ']c',          '<Cmd>tabnext<CR>')
map('n', '<leader>c',   '<Cmd>tablast<CR>')
-- >>>
-- Vimrc <<<
map('n', '<leader>e',   '<Cmd>edit $MYVIMRC<CR>')
map('n', '<leader>E',   '<Cmd>source $MYVIMRC<CR>')
-- >>>
-- move lines by tab width in visual mode <<<
map('n', '>', '>gv')
map('n', '<', '<gv')
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
