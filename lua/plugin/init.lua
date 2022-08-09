local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('config') .. '/lua/plugin/packer_compiled.lua'

-- initialize packer on demand <<<
function initPacker(compile)
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
  packer = require('packer')
  packer.reset()
  packer.init({
    compile_path = compile_path,
    compile_on_sync = true,
  })
  use = packer.use
  -- plugins list <<<
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'gentoo/gentoo-syntax'
  use 'vifm/vifm.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'preservim/tagbar'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lewis6991/gitsigns.nvim'
  use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use 'tommcdo/vim-lion'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rebelot/kanagawa.nvim'
  -- >>>

  -- Sync and compile if required
  if packer_bootstrap then
    packer.sync()
  end
  if compile then
    packer.compile()
  end
  -- Remove PackerInit cmd after initializtion
  vim.api.nvim_del_user_command('PackerInit')
end
-- >>>

-- load impatient.nvim before loading other plugins
pcall(require, 'impatient')

-- Load packer on-demand using PackerInit command; :PackerInit
if fn.empty(fn.glob(compile_path)) > 0 then
  initPacker(1)
else
  vim.api.nvim_create_user_command('PackerInit', 'lua initPacker()', {})
end

require('plugin/packer_compiled')
require('plugin/setup')
