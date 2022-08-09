local fn = vim.fn
local cmd = vim.cmd

-- toggle quickfix list
function ToggleQuickFix()
  local isQflistOn = fn.getwininfo(fn.win_getid())[1].quickfix
  if isQflistOn == 1 then
    cmd("cclose")
  else
    cmd("copen")
  end
end

-- toggle location list
function ToggleLocList()
  local isLocListOn = fn.getwininfo(fn.win_getid())[1].loclist
  if isLocListOn == 1 then
    cmd('lclose')
  else
    cmd('lopen')
  end
end

-- jump to start of line
function JumpToStartOfLine()
  local curCol = vim.fn.col(".")
  if curCol == 1 then
    cmd('normal _')
  else
    cmd('normal 0')
  end
end

-- jump to end of line
function JumpToEndOfLine()
  local curCol = vim.fn.col(".")
  local endCol = vim.fn.col("$") - 1
  if curCol == endCol then
    cmd('normal g_')
  else
    cmd('normal $')
  end
end

-- buffer menu
function BuffersMenu()
  local actions = {
    "enew",
    "b#",
    "w!",
    "bd!",
    "",
  }
  local action = vim.fn.confirm("Buffers?", "&new\n&last\n&save\n&delete\n&all")
  if action > 0 then
    vim.cmd(actions[action])
  end
end

-- tab menu
function TabsMenu()
  local actions = {
    "tabnew",
    "tablast",
    "tabclose",
    "",
  }
  local action = vim.fn.confirm("Tabs?", "&new\n&last\n&close\n&all")
  if action > 0 then
    -- trying to close the last tab returns error
    if action == 3 and #vim.api.nvim_list_tabpages() == 1 then return end
    vim.cmd(actions[action])
  end
end

