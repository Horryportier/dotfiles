local M = {}

local wezterm = require 'wezterm'

function M.set_colors(config)
	config.color_scheme = "Catppuccin Mocha"
	config.window_background_opacity = 0.8

	config.window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),

		font_size = 12.0,

		active_titlebar_bg = "#A301F3",

		inactive_titlebar_bg = "#333333",
		enable_top_bar = true,
	}
	config.window_decorations = "NONE"

	config.colors = {
		tab_bar = {
			inactive_tab_edge = "#575757",
		},
	}
    return config
end

return M
