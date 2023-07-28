local M = {}

local wazterm = require 'wazterm'
local colors = require 'colors'

function M.apply_to_config(config)
    colors.set_colors(config)
end

return M
