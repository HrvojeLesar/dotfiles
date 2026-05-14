local G = require("globals")

require("curves")
require("env-vars")
require("keybindings")
require("monitors")
require("windows")

hl.on("hyprland.start", function()
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme "breeze_cursors"')
	hl.exec_cmd(G.waybar)
	hl.exec_cmd("swaync")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
	-- hl.exec_cmd('gnome-keyring-daemon --replace --login -d --components=pkcs11,secrets')
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("xrandr --output DP-4 --primary")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("spotify")

	-- hl.exec_cmd("touch /tmp/bb-enabled")
	-- hl.exec_cmd("quickshell")
end)

local general = {
	gaps_in = 5,
	gaps_out = 15,

	border_size = 2,

	col = {
		active_border = {
			colors = {
				"rgba(33ccffee)",
				"rgba(00ff99ee)",
			},
			angle = 45,
		},
		inactive_border = "rgba(595959aa)",
	},

	resize_on_border = false,

	allow_tearing = false,

	layout = "dwindle",
}

local decoration = {
	rounding = 5,
	rounding_power = 2,

	active_opacity = 1.0,
	inactive_opacity = 1.0,

	shadow = {
		enabled = true,
		range = 4,
		render_power = 3,
		color = "rgba(1a1a1aee)",
	},

	blur = {
		enabled = false,
		size = 3,
		passes = 1,

		vibrancy = 0.1696,
	},
}

local animations = {
	enabled = true,
}

local dwindle = {
	preserve_split = true,
}

local misc = {
	force_default_wallpaper = 0,
	disable_hyprland_logo = true,
}

local input = {
	kb_layout = "hr, ru",
	kb_variant = ", phonetic",
	kb_model = "",
	kb_options = "",
	kb_rules = "",

	follow_mouse = true,

	sensitivity = "-0.6",
	touchpad = {
		natural_scroll = true,
	},

	repeat_delay = 225,
	repeat_rate = 33,

	numlock_by_default = true,
}

local cursor = {
	no_hardware_cursors = 0,
	default_monitor = "DP-4",
}

local group = {
	col = {
		border_active = {
			colors = {
				"rgba(33ccffee)",
				"rgba(00ff99ee)",
			},
			angle = 45,
		},
		border_inactive = "rgba(595959aa)",
	},
}

local debug = {
	disable_logs = false,
}

hl.config({
	general = general,
	decoration = decoration,
	animations = animations,
	dwindle = dwindle,
	misc = misc,
	input = input,
	cursor = cursor,
	group = group,
	debug = debug,
})

hl.device({
	name = "logitech-g703-ls-1",
	sensitivity = -0.6,
})

hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("hyprlock --no-fade-in --immediate-render"), { locked = true })
