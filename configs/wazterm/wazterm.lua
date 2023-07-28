-- local helpers = require 'helpers'
-- local config = {}
-- helpers.apply_to_config(config)
-- return config

local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

wezterm.on("user-var-changed", function(window, pane, name, value)
	if name == "workspace_switch" then
		local workspace_name = string.match(value, ".+/(.+)$")
		window:perform_action(
			act.SwitchToWorkspace({
				name = workspace_name,
				spawn = { cwd = value },
			}),
			pane
		)
		window:set_right_status(window:active_workspace())
	elseif name == "workspace_switch_session_name" then
		window:perform_action(
			act.SwitchToWorkspace({
				name = value,
			}),
			pane
		)
		window:set_right_status(window:active_workspace())
	end
end)

local function set_colors()
	config.color_scheme = "rose-pine"
	config.window_background_opacity = 0.9

	config.window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),

		font_size = 7.0,

		active_titlebar_bg = "green",

		inactive_titlebar_bg = "purple",
		-- enable_top_bar = true,
	}
	config.window_decorations = "NONE"

	config.colors = {
		tab_bar = {
			inactive_tab_edge = "white",
		},
	}
	config.hide_tab_bar_if_only_one_tab = true
end

local function other()
	config.audible_bell = "Disabled"
	local mux = wezterm.mux

	wezterm.on("gui-startup", function()
		local _, _, window = mux.spawn_window({})
		window:gui_window():maximize()
	end)
end

local function set_hyperlinks()
	-- Use the defaults as a base
	config.hyperlink_rules = wezterm.default_hyperlink_rules()

	local hyperlinks = {
		{
			-- link to github
			-- name/repo
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = "https://www.github.com/$1/$3",
		},
        {
			-- goes to wikipedia when  when wiki "word"
			regex = [[(?<=\bg\s)(\w+)]],
			format = "https://www.google.com/search?client=firefox-b-d&q=$1",
		},
		{
			-- goes to wikipedia when  when wiki "word"
			regex = [[(?<=\bwiki\s)(\w+)]],
			format = "https://www.wikipedia.com/wiki/$1",
		},
		{
			-- goes to youtube when  when yt "channel name"
			regex = [[(?<=\byt\s)(\w+)]],
			format = "https://www.youtube.com/@$1",
		},
		{
			-- goes to twitter when  when tweet "twitter user name"
			regex = [[(?<=\btweet\s)(\w+)]],
			format = "https://twitter.com/$1",
		},
		{
			regex = [[(?<=\bchamp\s)(\w+)]],
			format = "https://lolalytics.com/lol/$1/build",
		},
	}

	for _, value in pairs(hyperlinks) do
		table.insert(config.hyperlink_rules, value)
	end
end

local function set_keys()
	config.keys = {
		-- This will create a new split and run your default program inside it
		{
			key = '"',
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "'",
			mods = "CTRL|ALT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "b", -- Whatever key you might like
			mods = "CTRL|SHIFT", -- Whatever mods you like
			action = act.EmitEvent("smart_workspace_switcher"),
		},
	}
end

local function set_plugins()
	-- Update the path variable with the real path of the script:
	-- local path = "/home/horryportier/.local/bin/workspace_switcher.sh"
	--local path = wezterm.home_dir .. "/.local/bin/workspace_switcher.sh"

	wezterm.on("smart_workspace_switcher", function(window, pane)
		local path = wezterm.home_dir .. "/.local/bin/workspace_switcher.sh"
		wezterm.log_info("the path is: " .. path)
		if not path then
			wezterm.log_error("workspace_switcher.sh not found")
			return
		end
		local current_tab_id = pane:tab():tab_id()
		local tab, _, _ = window:mux_window():spawn_tab({ args = { "ws", "--tab-id", tostring(current_tab_id) } })
		tab:set_title("Workspace Switcher")
	end)
end

set_plugins()
set_colors()
other()
set_hyperlinks()
set_keys()

return config
