local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.color_scheme = 'Batman'
config.enable_tab_bar = false
config.font_size = 10
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.enable_scroll_bar = false
config.window_frame = {
	active_titlebar_bg = '#333333',
	inactive_titlebar_bg = '#333333',
}
config.keys = {
	{
		key = 'L',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.SplitPane {
			direction = 'Right',
			size = { Percent = 50},
		},
	},
	{
		key = 'H',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.SplitPane {
			direction = 'Down',
			size = { Percent = 50},
		},
	},
	{
		key = 'D',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.CloseCurrentPane {
			confirm = true,
		},
	},
}

config.window_background_opacity = 0.9

return config
