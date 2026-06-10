-- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-- hl.workspace_rule({ workspace = "12", layout = "scrolling", gaps_out = 0, gaps_in = 0, no_rounding = true })

hl.window_rule({
	suppress_event = "maximize",
	match = { class = "*" },
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	no_focus = true,
	match = { class = "^$", title = "^$", xwayland = 1, float = 1, fullscreen = 0, pin = 0 },
})

-- Program workspace startup
hl.window_rule({
	workspace = "special:spotify silent",
	match = { class = "Spotify" },
})
hl.window_rule({
	workspace = "1 silent",
	match = { class = "^discord.*" },
})
hl.window_rule({
	workspace = "13 silent",
	match = { class = "steam" },
})

hl.window_rule({
	float = true,
	match = { class = "steam", initial_title = "negative:Steam" },
})
hl.window_rule({
	tile = true,
	match = { class = "^steam_app.*" },
})

hl.window_rule({
	border_color = "rgba(33ccffee)",
	match = { pin = 1, focus = true },
})
hl.window_rule({
	border_color = "rgba(33ccffee) rgba(00ff99ee)",
	match = { pin = 1, focus = false },
})

hl.window_rule({
	float = true,
	match = { class = "imv" },
})

hl.window_rule({
	decorate = false,
	match = { tag = "freeze" },
})
hl.window_rule({
	no_focus = true,
	match = { tag = "freeze" },
})

hl.window_rule({
	opacity = "0.85 override",
	match = { tag = "opacity-85" },
})

-- Flameshot
hl.window_rule({
	no_anim = true,
	match = { class = "^(flameshot)$" },
})
hl.window_rule({
	float = true,
	match = { class = "^(flameshot)$" },
})
hl.window_rule({
	fullscreen_state = "0 2",
	match = { class = "^(flameshot)$" },
})
hl.window_rule({
	monitor = 0,
	match = { class = "^(flameshot)$" },
})
hl.window_rule({
	move = { 0, -163 },
	match = { class = "^(flameshot)$" },
})

hl.window_rule({
	no_anim = true,
	match = { initial_title = "woomer" },
})
hl.window_rule({
	float = true,
	match = { initial_title = "woomer" },
})
hl.window_rule({
	fullscreen = true,
	match = { initial_title = "woomer" },
})

hl.window_rule({
	tile = true,
	match = { initial_title = "^WhatsApp.*" },
})
hl.window_rule({
	tile = true,
	match = { initial_title = "^Hyprland Wiki.*" },
})
hl.window_rule({
	tile = true,
	match = { initial_title = "^Immich.*" },
})
hl.window_rule({
	tile = true,
	match = { initial_title = "^Fifty Fifty Fifty Feedfinder.*" },
})

hl.window_rule({
	no_screen_share = true,
	match = { initial_title = "^WhatsApp.*" },
})
hl.window_rule({
	no_screen_share = true,
	match = { title = ".*Vaultwarden.*" },
})
hl.window_rule({
	no_screen_share = true,
	match = { title = ".*Bitwarden.*" },
})
hl.window_rule({
	no_screen_share = true,
	match = { title = ".*rbw.*" },
})
hl.layer_rule({
	no_screen_share = true,
	match = { namespace = "rbw" },
})

hl.window_rule({
	tag = "+eve",
	match = { class = "steam_app_8500" },
})
hl.window_rule({
	tag = "+eve_client",
	match = { class = "steam_app_8500", initial_title = "EVE" },
})
hl.window_rule({
	workspace = "13 silent",
	match = { class = "steam_app_8500", float = 1, title = "^$" },
})
hl.window_rule({
	workspace = "13 silent",
	match = { class = "steam_app_8500", initial_title = "EVE Launcher" },
})
hl.window_rule({
	workspace = "12 silent",
	match = { tag = "eve_client" },
})
hl.window_rule({
	allows_input = true,
	match = { tag = "eve_client" },
})
hl.window_rule({
	render_unfocused = true,
	match = { tag = "eve_client" },
})
hl.window_rule({
	float = false,
	match = { tag = "eve_client" },
})
hl.window_rule({
	fullscreen = false,
	match = { tag = "eve_client" },
})
hl.window_rule({
	fullscreen_state = "0 1",
	match = { tag = "eve_client" },
})
hl.window_rule({
	tile = true,
	match = { tag = "eve_client" },
})
-- reg add 'HKEY_CURRENT_USER\Software\Wine\X11 Driver' /t REG_SZ /v UseTakeFocus /d N /f

-- Dota 2 settings
hl.window_rule({
	float = false,
	match = { class = "^dota2$" },
})
hl.window_rule({
	fullscreen = false,
	match = { class = "^dota2$" },
})
hl.window_rule({
	fullscreen_state = "0 1",
	match = { class = "^dota2$" },
})
hl.window_rule({
	tile = true,
	match = { class = "^dota2$" },
})
hl.window_rule({
	workspace = "12 silent",
	match = { class = "^dota2$" },
})
hl.window_rule({
	allows_input = true,
	match = { class = "^dota2$" },
})
hl.window_rule({
	render_unfocused = true,
	match = { class = "^dota2$" },
})

-- Kenshi settings
hl.window_rule({
	float = false,
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	fullscreen = false,
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	fullscreen_state = "0 0",
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	tile = true,
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	no_max_size = true,
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	persistent_size = false,
	match = { class = "^steam_app_233860$" },
})
hl.window_rule({
	min_size = { 200, 200 },
	match = { class = "^steam_app_233860$" },
})

hl.window_rule({
	opacity = "0 override 0 override 0 override",
	match = { tag = "transparent" },
})

hl.window_rule({
	idle_inhibit = "always",
	match = { class = "^discord.*" },
})

-- Path of exile
hl.window_rule({
	workspace = "12 silent",
	match = { class = "^steam_app_238960$" },
})

-- CS2 Settings
hl.window_rule({
	tag = "+cs2",
	match = { class = "cs2" },
})
hl.window_rule({
	workspace = "12 silent",
	match = { tag = "cs2" },
})
hl.window_rule({
	float = false,
	match = { tag = "cs2" },
})
hl.window_rule({
	tile = true,
	match = { class = "cs2" },
})

-- Deadlock settings
hl.window_rule({
	tag = "+deadlock",
	match = { class = "steam_app_1422450" },
})
hl.window_rule({
	workspace = "12 silent",
	fullscreen = false,
	float = false,
	tile = true,
	fullscreen_state = "0 1",
	allows_input = true,
	render_unfocused = true,
	match = { tag = "deadlock" },
})

-- warframe settings
hl.window_rule({
	tag = "+warframe",
	match = { class = "steam_app_230410" },
})
hl.window_rule({
	workspace = "12 silent",
	fullscreen = false,
	float = false,
	tile = true,
	fullscreen_state = "0 1",
	allows_input = true,
	render_unfocused = true,
	match = { tag = "warframe" },
})
