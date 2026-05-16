local G = require("globals")
local hs = require("plugins.hyprsplit")
hs.config({
	num_workspaces = 10,
	persistent_workspaces = true,
})

--- @param bind string
--- @return string
local function k(bind)
	return G.main_mod .. " + " .. bind
end

--- @param by number
local function zoom(by)
	local zoom_factor = hl.get_config("cursor.zoom_factor")

	if type(zoom_factor) ~= "number" then
		return
	end

	zoom_factor = zoom_factor + by

	hl.config({
		cursor = { zoom_factor = zoom_factor },
	})
end

--- @param direction string
local function focus(direction)
	local workspace = hl.get_active_workspace()
	if workspace == nil then
		return
	end

	if workspace.tiled_layout ~= "scrolling" then
		hl.dispatch(hl.dsp.focus({ direction = direction }))
	else
        hl.dispatch(hl.dsp.layout("focus " .. direction))
	end
end

hl.bind(k("M"), hl.dsp.exit())
hl.bind(k("E"), hl.dsp.exec_cmd(G.file_manager))
hl.bind(k("A"), hl.dsp.exec_cmd(G.menu))
hl.bind(k("W"), hl.dsp.exec_cmd("rofi -show window -show-icons"))
hl.bind(k("Z"), hl.dsp.exec_cmd("hyprlock"))

hl.bind(k("CONTROL + P"), hl.dsp.window.pseudo())
hl.bind(k("CONTROL + Space"), hl.dsp.layout("togglesplit"))

hl.bind(k("T"), hl.dsp.exec_cmd(G.terminal))
hl.bind(k("Return"), hl.dsp.exec_cmd(G.terminal))
hl.bind(k("Q"), hl.dsp.window.close())
hl.bind(k("SHIFT + Q"), hl.dsp.window.kill())
hl.bind(k("B"), hl.dsp.exec_cmd(G.brave))
hl.bind(k("SHIFT + B"), hl.dsp.exec_cmd(G.brave_incognito))
hl.bind(k("CONTROL + R"), hl.dsp.exec_cmd(G.waybar))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -zm region"))
hl.bind(
	"CONTROL + Print",
	hl.dsp.exec_cmd(
		"hyprshot -zm region --raw | satty --early-exit --initial-tool rectangle --copy-command wl-copy --fullscreen --save-after-copy --output-filename ~/Pictures/satty-$(date '+%Y%m%d-%H:%M:%S').png --disable-notifications  --filename -"
	)
)
hl.bind(k("V"), hl.dsp.exec_cmd("rofi -modi clipboard:~/.config/hypr/cliphist-rofi-img -show clipboard -show-icons"))
hl.bind(k("D"), hl.dsp.exec_cmd("discord --enable-features=UseOzonePlatform --ozone-platform=wayland"))
-- hl.bind(k("S"), hl.dsp.exec_cmd("spotify"))

hl.bind(k("CONTROL + SHIFT + ALT + O"), hl.dsp.exec_cmd("~/.config/rofi/wallpaper-launcher.sh"))
hl.bind(k("CONTROL + SHIFT + ALT + I"), hl.dsp.exec_cmd("~/.config/rofi/run-i.sh"))

hl.bind(k("mouse_down"), function()
	zoom(0.5)
end)
hl.bind(k("mouse_up"), function()
	zoom(-0.5)
end)
hl.bind(k("SHIFT + mouse_up"), function()
	hl.config({
		cursor = { zoom_factor = 1.0 },
	})
end)

--  Window management
hl.bind(k("Space"), hl.dsp.window.float())
hl.bind(k("F"), hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
hl.bind(k("SHIFT + F"), hl.dsp.window.fullscreen_state({ internal = 1, client = 0, action = "toggle" }))

-- Move focus
hl.bind(k("H"), function()
	focus("l")
end)
hl.bind(k("L"), function()
	focus("r")
end)
hl.bind(k("K"), function()
	focus("u")
end)
hl.bind(k("J"), function()
	focus("d")
end)

-- Move window
hl.bind(k("SHIFT + H"), hl.dsp.window.move({ direction = "l" }))
hl.bind(k("SHIFT + L"), hl.dsp.window.move({ direction = "r" }))
hl.bind(k("SHIFT + K"), hl.dsp.window.move({ direction = "u" }))
hl.bind(k("SHIFT + J"), hl.dsp.window.move({ direction = "d" }))

-- Move window to monitor
hl.bind(k("CONTROL + SHIFT + H"), hl.dsp.window.move({ monitor = "l" }))
hl.bind(k("CONTROL + SHIFT + L"), hl.dsp.window.move({ monitor = "r" }))
hl.bind(k("CONTROL + SHIFT + K"), hl.dsp.window.move({ monitor = "u" }))
hl.bind(k("CONTROL + SHIFT + J"), hl.dsp.window.move({ monitor = "d" }))

-- Resize window
hl.bind(k("CONTROL + H"), hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true })
hl.bind(k("CONTROL + L"), hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { repeating = true })
hl.bind(k("CONTROL + K"), hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true })
hl.bind(k("CONTROL + J"), hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { repeating = true })

if hs ~= nil then
	hl.bind(k("1"), hs.dsp.focus({ workspace = 1 }))
	hl.bind(k("2"), hs.dsp.focus({ workspace = 2 }))
	hl.bind(k("3"), hs.dsp.focus({ workspace = 3 }))
	hl.bind(k("4"), hs.dsp.focus({ workspace = 4 }))
	hl.bind(k("5"), hs.dsp.focus({ workspace = 5 }))
	hl.bind(k("6"), hs.dsp.focus({ workspace = 6 }))
	hl.bind(k("7"), hs.dsp.focus({ workspace = 7 }))
	hl.bind(k("8"), hs.dsp.focus({ workspace = 8 }))
	hl.bind(k("9"), hs.dsp.focus({ workspace = 9 }))
	hl.bind(k("0"), hs.dsp.focus({ workspace = 0 }))
else
	hl.bind(k("1"), hl.dsp.focus({ workspace = 1 }))
	hl.bind(k("2"), hl.dsp.focus({ workspace = 2 }))
	hl.bind(k("3"), hl.dsp.focus({ workspace = 3 }))
	hl.bind(k("4"), hl.dsp.focus({ workspace = 4 }))
	hl.bind(k("5"), hl.dsp.focus({ workspace = 5 }))
	hl.bind(k("6"), hl.dsp.focus({ workspace = 6 }))
	hl.bind(k("7"), hl.dsp.focus({ workspace = 7 }))
	hl.bind(k("8"), hl.dsp.focus({ workspace = 8 }))
	hl.bind(k("9"), hl.dsp.focus({ workspace = 9 }))
	hl.bind(k("0"), hl.dsp.focus({ workspace = 0 }))
end

hl.bind(k("N"), hl.dsp.focus({ workspace = "r+1" }), { repeating = true })
hl.bind(k("P"), hl.dsp.focus({ workspace = "r-1" }), { repeating = true })

if hs ~= nil then
	hl.bind(k("SHIFT + 1"), hs.dsp.window.move({ workspace = 1, follow = true }))
	hl.bind(k("SHIFT + 2"), hs.dsp.window.move({ workspace = 2, follow = true }))
	hl.bind(k("SHIFT + 3"), hs.dsp.window.move({ workspace = 3, follow = true }))
	hl.bind(k("SHIFT + 4"), hs.dsp.window.move({ workspace = 4, follow = true }))
	hl.bind(k("SHIFT + 5"), hs.dsp.window.move({ workspace = 5, follow = true }))
	hl.bind(k("SHIFT + 6"), hs.dsp.window.move({ workspace = 6, follow = true }))
	hl.bind(k("SHIFT + 7"), hs.dsp.window.move({ workspace = 7, follow = true }))
	hl.bind(k("SHIFT + 8"), hs.dsp.window.move({ workspace = 8, follow = true }))
	hl.bind(k("SHIFT + 9"), hs.dsp.window.move({ workspace = 9, follow = true }))
	hl.bind(k("SHIFT + 0"), hs.dsp.window.move({ workspace = 10, follow = true }))
else
	hl.bind(k("SHIFT + 1"), hl.dsp.window.move({ workspace = 1, follow = true }))
	hl.bind(k("SHIFT + 2"), hl.dsp.window.move({ workspace = 2, follow = true }))
	hl.bind(k("SHIFT + 3"), hl.dsp.window.move({ workspace = 3, follow = true }))
	hl.bind(k("SHIFT + 4"), hl.dsp.window.move({ workspace = 4, follow = true }))
	hl.bind(k("SHIFT + 5"), hl.dsp.window.move({ workspace = 5, follow = true }))
	hl.bind(k("SHIFT + 6"), hl.dsp.window.move({ workspace = 6, follow = true }))
	hl.bind(k("SHIFT + 7"), hl.dsp.window.move({ workspace = 7, follow = true }))
	hl.bind(k("SHIFT + 8"), hl.dsp.window.move({ workspace = 8, follow = true }))
	hl.bind(k("SHIFT + 9"), hl.dsp.window.move({ workspace = 9, follow = true }))
	hl.bind(k("SHIFT + 0"), hl.dsp.window.move({ workspace = 10, follow = true }))
end

hl.bind(k("SHIFT + N"), hl.dsp.window.move({ workspace = "r+1" }), { repeating = true })
hl.bind(k("SHIFT + P"), hl.dsp.window.move({ workspace = "r-1" }), { repeating = true })

hl.bind(k("CONTROL + SHIFT + N"), hl.dsp.window.move({ workspace = "emptyn" }), { repeating = true })
hl.bind(k("CONTROL + SHIFT + P"), hl.dsp.window.move({ workspace = "emptym" }), { repeating = true })

if hs ~= nil then
	hl.bind(k("CONTROL + 1"), hs.dsp.window.move({ workspace = 1 }))
	hl.bind(k("CONTROL + 2"), hs.dsp.window.move({ workspace = 2 }))
	hl.bind(k("CONTROL + 3"), hs.dsp.window.move({ workspace = 3 }))
	hl.bind(k("CONTROL + 4"), hs.dsp.window.move({ workspace = 4 }))
	hl.bind(k("CONTROL + 5"), hs.dsp.window.move({ workspace = 5 }))
	hl.bind(k("CONTROL + 6"), hs.dsp.window.move({ workspace = 6 }))
	hl.bind(k("CONTROL + 7"), hs.dsp.window.move({ workspace = 7 }))
	hl.bind(k("CONTROL + 8"), hs.dsp.window.move({ workspace = 8 }))
	hl.bind(k("CONTROL + 9"), hs.dsp.window.move({ workspace = 9 }))
	hl.bind(k("CONTROL + 0"), hs.dsp.window.move({ workspace = 10 }))
else
	hl.bind(k("CONTROL + 1"), hl.dsp.window.move({ workspace = 1 }))
	hl.bind(k("CONTROL + 2"), hl.dsp.window.move({ workspace = 2 }))
	hl.bind(k("CONTROL + 3"), hl.dsp.window.move({ workspace = 3 }))
	hl.bind(k("CONTROL + 4"), hl.dsp.window.move({ workspace = 4 }))
	hl.bind(k("CONTROL + 5"), hl.dsp.window.move({ workspace = 5 }))
	hl.bind(k("CONTROL + 6"), hl.dsp.window.move({ workspace = 6 }))
	hl.bind(k("CONTROL + 7"), hl.dsp.window.move({ workspace = 7 }))
	hl.bind(k("CONTROL + 8"), hl.dsp.window.move({ workspace = 8 }))
	hl.bind(k("CONTROL + 9"), hl.dsp.window.move({ workspace = 9 }))
	hl.bind(k("CONTROL + 0"), hl.dsp.window.move({ workspace = 10 }))
end

hl.bind(k("CONTROL + S"), hl.dsp.workspace.toggle_special("restore"))
hl.bind(k("X"), hl.dsp.exec_cmd("~/.config/hypr/move-to-restore.sh"))
hl.bind(k("R"), hl.dsp.exec_cmd("~/.config/hypr/restore-window.sh"))
hl.bind(k("ALT + P"), hl.dsp.window.pin())
hl.bind(k("ALT + F"), hl.dsp.window.tag({ tag = "+freeze" }))
hl.bind(k("CONTROL + F"), hl.dsp.window.tag({ tag = "-freeze", window = "tag:freeze" }))
hl.bind(k("SHIFT + G"), hl.dsp.window.tag({ tag = "opacity-85" }))

hl.bind(k("S"), hl.dsp.workspace.toggle_special("spotify"))

hl.bind(k("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(k("mouse:273"), hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ repeating = true, locked = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, ignore_mods = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, ignore_mods = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, ignore_mods = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, ignore_mods = true })

hl.bind(k("SHIFT + V"), hl.dsp.exec_cmd("rofi-rbw"))
hl.bind(k("SHIFT + E"), hl.dsp.exec_cmd("rofimoji -a copy"))

hl.bind(k("CONTROL + SHIFT + G"), hl.dsp.group.toggle())
hl.bind(k("TAB"), hl.dsp.group.next())
hl.bind(k("SHIFT + TAB"), hl.dsp.group.prev())
hl.bind(k("G"), hl.dsp.window.move({ out_of_group = true }))

hl.bind(k("Y"), hl.dsp.global("quickshell:sidebar-toggle-pin"))
