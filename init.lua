-- disable unused built plugins <<<
local disabled_builtins = {
  "2html_plugin",  "getscript",   "getscriptPlugin", "gzip",              "logipat",
  "netrw",         "netrwPlugin", "netrwSettings",   "netrwFileHandlers", "matchit",
  "tar",           "tarPlugin",   "rrhelper",        "spellfile_plugin",  "vimball",
  "vimballPlugin", "zip",         "zipPlugin",       "tutor",             "rplugin",
  "synmenu",       "optwin",      "compiler",        "bugreport",         "ftplugin",
}
for i =1, #disabled_builtins do
  vim.g["loaded_" .. disabled_builtins[i]] = true
end
-- >>>

-- source lua config files
require('options')      -- neovim settings options
require('functions')    -- helper functions
require('autocmds')     -- auto commands
require('mappings')     -- key maps
require('statusline')   -- custom statusline
require('plugin')       -- plugins and plugin settings
