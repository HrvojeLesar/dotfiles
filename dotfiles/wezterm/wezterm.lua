-- Pull in the wezterm API
local wezterm = require("wezterm")
local globals = require("globals")

-- Register local modules
require("background")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = globals.COLOR_SCHEME
config.colors = {
	background = "#161719",
	selection_fg = "none",
	selection_bg = "rgba(50% 50% 50% 50%)",
}

config.warn_about_missing_glyphs = false

config.font = wezterm.font({
	family = "Fira Code Nerd Font Mono",
	weight = "Regular",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = globals.OPACITY

config.disable_default_key_bindings = true

config.enable_wayland = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.mouse_bindings = {
	-- Bind 'Up' event of CTRL-Click to open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.Nop,
	},
}

config.audible_bell = "Disabled"

config.keys = {
	{ key = ";", mods = "SUPER", action = wezterm.action.EmitEvent("toggle-opacity") },
	{ key = "+", mods = "SUPER", action = wezterm.action.EmitEvent("toggle-full-transparent") },
	{ key = "]", mods = "SUPER", action = wezterm.action.EmitEvent("next-background") },
	{ key = "[", mods = "SUPER", action = wezterm.action.EmitEvent("previous-background") },
	{ key = "\\", mods = "SUPER", action = wezterm.action.EmitEvent("toggle-background") },
	{ key = "'", mods = "SUPER", action = wezterm.action.EmitEvent("toggle-explicit") },
	{ key = ".", mods = "SUPER", action = wezterm.action.EmitEvent("up-opacity") },
	{ key = ",", mods = "SUPER", action = wezterm.action.EmitEvent("down-opacity") },
}

if config.disable_default_key_bindings then
	table.insert(config.keys, { key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize })
	table.insert(config.keys, { key = "+", mods = "SHIFT|CTRL", action = wezterm.action.IncreaseFontSize })
	table.insert(config.keys, { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize })
	table.insert(config.keys, { key = "=", mods = "SHIFT|CTRL", action = wezterm.action.IncreaseFontSize })
	table.insert(config.keys, { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize })

	table.insert(config.keys, { key = "_", mods = "CTRL", action = wezterm.action.DecreaseFontSize })
	table.insert(config.keys, { key = "_", mods = "SHIFT|CTRL", action = wezterm.action.DecreaseFontSize })
	table.insert(config.keys, { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize })
	table.insert(config.keys, { key = "-", mods = "SHIFT|CTRL", action = wezterm.action.DecreaseFontSize })
	table.insert(config.keys, { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize })

	table.insert(config.keys, { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize })
	table.insert(config.keys, { key = "0", mods = "SHIFT|CTRL", action = wezterm.action.ResetFontSize })
	table.insert(config.keys, { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize })
	table.insert(config.keys, { key = ")", mods = "CTRL", action = wezterm.action.ResetFontSize })
	table.insert(config.keys, { key = ")", mods = "SHIFT|CTRL", action = wezterm.action.ResetFontSize })

	table.insert(config.keys, { key = "C", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") })
	table.insert(config.keys, { key = "C", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") })
	table.insert(config.keys, { key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") })
	table.insert(config.keys, { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") })
	table.insert(config.keys, { key = "Copy", mods = "NONE", action = wezterm.action.CopyTo("Clipboard") })

	table.insert(config.keys, { key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") })
	table.insert(config.keys, { key = "V", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") })
	table.insert(config.keys, { key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") })
	table.insert(config.keys, { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") })
	table.insert(config.keys, { key = "Paste", mods = "NONE", action = wezterm.action.PasteFrom("Clipboard") })
end

-- and finally, return the configuration to wezterm
return config
