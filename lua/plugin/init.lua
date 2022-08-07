local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('config') .. '/lua/plugin/packer_compiled.lua'

function initPacker()
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
  packer = require('packer')
  packer.reset()
  packer.init({
    compile_path = compile_path,
    compile_on_sync = true
  })

  use = packer.use
  use 'wbthomason/packer.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'preservim/tagbar'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lewis6991/gitsigns.nvim'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use 'tommcdo/vim-lion'
  use 'rebelot/kanagawa.nvim'

  if packer_bootstrap then
    packer.sync()
  end

  vim.api.nvim_del_user_command('PackerInit')
end

if fn.empty(fn.glob(compile_path)) > 0 then
  initPacker()
  require('packer').compile()
else
  vim.api.nvim_create_user_command('PackerInit', 'lua initPacker()', {})
end

require('plugin/packer_compiled')
require('plugin/setup')

