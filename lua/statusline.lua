-- colors from kanagawa.nvim
local colors = {
  sumiInk0      = "#16161D",
  sumiInk1      = "#1F1F28",
  sumiInk2      = "#2A2A37",
  sumiInk3      = "#363646",
  sumiInk4      = "#54546D",
  fujiWhite     = "#DCD7BA",
  fujiGray      = "#727169",
  autumnGreen   = "#76946A",
  roninYellow   = "#FF9E3B",
  oniViolet     = "#957FB8",
  crystalBlue   = "#7E9CD8",
  springBlue    = "#7FB4CA",
  springGreen   = "#98BB6C",
  boatYellow1   = "#938056",
  carpYellow    = "#E6C384",
  sakuraPink    = "#D27E99",
  peachRed      = "#FF5D62",
  surimiOrange  = "#FFA066",
}

local hl = vim.api.nvim_set_hl
hl(0, 'StatusLineNormal',               { fg = colors.fujiWhite,   bg = colors.sumiInk2 })
hl(0, 'StatusLineBright',               { fg = colors.fujiWhite,   bg = colors.sumiInk4 })
hl(0, 'StatusLineDim',                  { fg = colors.fujiWhite,   bg = colors.sumiInk0 })
hl(0, 'StatusLineDiffText',             { fg = colors.roninYellow, bg = colors.sumiInk2 })
hl(0, 'StatusLineDiffAdd',              { fg = colors.autumnGreen, bg = colors.sumiInk2 })
hl(0, 'StatusLineDiffChange',           { fg = colors.carpYellow,  bg = colors.sumiInk2 })
hl(0, 'StatusLineDiffDelete',           { fg = colors.peachRed,    bg = colors.sumiInk2 })
hl(0, 'StatusLineMode',                 { fg = colors.fujiWhite,   bg = colors.sumiInk4 })
hl(0, 'StatusLineModeNormal',           { fg = colors.fujiWhite,   bg = colors.sumiInk4 })
hl(0, 'StatusLineModeInsert',           { fg = colors.sumiInk0,    bg = colors.carpYellow })
hl(0, 'StatusLineModeVisual',           { fg = colors.sumiInk0,    bg = colors.springBlue })
hl(0, 'StatusLineModeReplace',          { fg = colors.sumiInk0,    bg = colors.peachRed })
hl(0, 'StatusLineModeCommand',          { fg = colors.sumiInk0,    bg = colors.oniViolet })
hl(0, 'StatusLineModeTerminal',         { fg = colors.sumiInk0,    bg = colors.fujiGray })
hl(0, 'LspDiagnosticsSignHint',         { fg = colors.autumnGreen, bg = colors.sumiInk2 })
hl(0, 'LspDiagnosticsSignError',        { fg = colors.peachRed,    bg = colors.sumiInk2 })
hl(0, 'LspDiagnosticsSignWarning',      { fg = colors.carpYellow,  bg = colors.sumiInk2 })
hl(0, 'LspDiagnosticsSignInformation',  { fg = colors.springBlue,  bg = colors.sumiInk2 })

local modes = {
  ["n"]     = { "NORMAL", 'Normal' },
  ["no"]    = { "NORMAL", 'Normal' },
  ["v"]     = { "VISUAL", 'Visual' },
  ["V"]     = { "VISUAL LINE", 'Visual' },
  [""]    = { "VISUAL BLOCK", 'Visual' },
  ["s"]     = { "SELECT", 'Select' },
  ["S"]     = { "SELECT LINE", 'Select' },
  [""]    = { "SELECT BLOCK", 'Select' },
  ["i"]     = { "INSERT", 'Insert' },
  ["ic"]    = { "INSERT", 'Insert' },
  ["R"]     = { "REPLACE", 'Replace' },
  ["Rv"]    = { "VISUAL REPLACE", 'Replace' },
  ["c"]     = { "COMMAND", 'Command' },
  ["cv"]    = { "VIM EX", },
  ["ce"]    = { "EX", },
  ["r"]     = { "PROMPT", },
  ["rm"]    = { "MOAR", },
  ["r?"]    = { "CONFIRM", },
  ["!"]     = { "SHELL", },
  ["t"]     = { "TERMINAL", 'Terminal' },
}

local function mode()
  local current_mode = modes[vim.api.nvim_get_mode().mode]
  return table.concat {"%#StatusLineMode",current_mode[2] or "","# ",current_mode[1]," "}
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return table.concat {fname, "%m%h%w "}
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. " %#Normal#"
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c "
end

local function gitstatus()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#StatusLineDiffAdd#+%d" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#StatusLineDiffChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#StatusLineDiffDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat {
     " ",
     "%#StatusLineDiffText#",
     " ",
     git_info.head,
     " ",
     added,
     changed,
     removed,
     " ",
     " %#Normal#",
  }
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    mode(),
    "%#StatusLineNormal# ",
    filepath(),
    filename(),
    gitstatus(),
    "%#StatusLineNormal#",
    "%=",
    --"%#StatusLineLsp#",
    lsp(),
    "%#StatusLineBright#",
    filetype(),
    lineinfo(),
    "%#Normal#",
  }
end

Statusline.inactive = function()
  return "%#StatusLineDim# %F"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
