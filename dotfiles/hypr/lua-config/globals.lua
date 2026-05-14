local M = {}

M.main_mod = "SUPER"
M.terminal = "wezterm"
M.file_manager = "nautilus"
M.menu = "rofi -show drun -show-icons -hover-select"
M.brave =
	"brave --ozone-platform=wayland --ozone-platform-hint=wayland --enable-features=TouchpadOverscrollHistoryNavigation"
M.brave_incognito =
	"brave --incognito --ozone-platform=wayland --ozone-platform-hint=wayland --enable-features=TouchpadOverscrollHistoryNavigation"
M.waybar = "~/.config/hypr/autostart/startbar.sh"

return M
