local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    underline = true,
    bg = "black2",
  },
  Visual = { bg = "darker_black" },
  Todo = { bold = true, bg = "pink" },
}
---@type hltable
M.add = {
  nvimtreeopenedfoldername = { fg = "green", bold = true },
}

return M
