local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.background = {
    {
        source = {
            Color = "#070303",
        },
        repeat_x = 'Mirror',
        repeat_y = 'Mirror',
        vertical_align = 'Middle',
        horizontal_align = 'Center',
        opacity = 1.0,
        height = "1080",
        width = "1920",
    },
}
config.front_end = "OpenGL"
config.window_close_confirmation = 'NeverPrompt'
config.enable_wayland = false 
config.color_scheme = 'Batman'
config.enable_tab_bar = false
config.font_size = 9
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.enable_scroll_bar = false
config.window_padding = {
    top = 6,
    left = 6,
    right = 6,
    bottom = 6,
}
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

config.colors = {
    foreground = 'silver',
    background = 'black',
    cursor_bg = '#dd4444',
    cursor_border = '#dd4444',
    ansi = {"#1d1b1e","#e64444","#c84646","#ff4444","#737174","#747271","#62605f","#c6c5bf"},
    brights = {"#505354","#ff8e8e","#ff7d7d","#fe6c6c","#919495","#9a9a9d","#a3a3a6","#dadbd6"}

}

return config
