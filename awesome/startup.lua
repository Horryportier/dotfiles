local awful = require("awful")
local naughty = require("naughty")

local S = {
	apps = {
		comptom = function()
			awful.spawn.with_shell("compton -b", {})
			return "RUNNING"
		end,
		xrandr = function()
			local first_monitor = "DP-1"
			local second_monitor = "HDMI-1-0"

			awful.spawn.with_shell(
				string.format("xrandr --output %s --auto --left-of %s", second_monitor, first_monitor)
			)
			return "RUNNING"
		end,
		obsidian = function()
			awful.spawn.with_shell("flatpak run md.obsidian.Obsidian")
			return "RUNNING"
		end,
		discord = function()
			awful.spawn.with_shell("discord")
			return "RUNNING"
		end,
		firefox = function()
			awful.spawn.with_shell("firefox")
			return "RUNNING"
		end,
		--		feh = function()
		--			awful.spawn.with_shell("feh --bg-fill /home/horry/Pictures/Wallpapers/dandadan.jpg")
		--			return "RUNNING"
		--		end,
		wezterm = function()
			awful.spawn.with_shell("wezterm")
			return "RUNNING"
		end,
		asdf = function()
			awful.spawn.with_shell("asdf")
			return "RUNNING"
		end,
		ibus_daemon = function()
			awful.spawn.with_shell("ibus-daemon")
			return "RUNNING"
		end,
	},
}

function S.startup()
	for name, app in pairs(S.apps) do
		local res = app()
		if res == "RUNNING" then
			naughty.notify({
				preset = naughty.config.presets.low,
				title = "RUNNING",
				text = name,
			})
		end
	end
end

return S
