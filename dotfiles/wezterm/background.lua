-- Pull in the wezterm API
local wezterm = require("wezterm")
local io = require("io")
local string = require("string")

local globals = require("globals")

if wezterm.GLOBAL.image_idx == nil then
    wezterm.GLOBAL.image_idx = 1
end

local function background_images()
    local directories = {}
    local files = {}

    for _, directory in pairs(directories) do
        if wezterm.GLOBAL.explicit ~= true and directory.explicit == true then
            goto dir_continue
        end
        for filename in io.popen("ls " .. directory.path):lines() do
            local len = string.len(filename)
            if len == 1 then
                goto continue
            end

            if string.sub(filename, 1, 1) ~= "W" then
                goto continue
            end

            files[#files + 1] = string.sub(directory.path, 3) .. "/" .. filename

            ::continue::
        end
        ::dir_continue::
    end
    return files
end

local function image_count()
    local count = 0
    for _ in pairs(background_images()) do
        count = count + 1
    end
    return count
end

local function get_background_image_path()
    local images = background_images()
    return images[wezterm.GLOBAL.image_idx]
end

local function change_background_opacity(overrides)
    local path = get_background_image_path()

    local use_background = wezterm.GLOBAL.use_background or false

    if use_background then
        local first_layer_opacity = (overrides.window_background_opacity or 0.95) - 0.25
        if overrides.window_background_opacity == 1.0 then
            first_layer_opacity = 1.0
        end
        local colors = wezterm.color.get_builtin_schemes()[globals.COLOR_SCHEME]

        return {
            window_background_opacity = overrides.window_background_opacity or 0.95,
            background = {
                {
                    source = { Color = colors.background },
                    opacity = first_layer_opacity,
                    height = "100%",
                    width = "100%",
                },
                {
                    source = { File = path },
                    height = "Contain",
                    width = "Contain",
                    repeat_x = "NoRepeat",
                    repeat_y = "NoRepeat",
                    vertical_align = "Middle",
                    horizontal_align = "Center",
                    opacity = overrides.window_background_opacity or 0.95,
                },
                {
                    source = { Color = colors.background },
                    opacity = (overrides.window_background_opacity or 0.95) - 0.40,
                    height = "100%",
                    width = "100%",
                },
            },
        }
    else
        return overrides
    end
end

wezterm.on("toggle-opacity", function(window)
    local overrides = window:get_config_overrides() or {}
    local current_opacity = overrides.window_background_opacity
    if current_opacity == globals.OPACITY then
        overrides.window_background_opacity = 0.6
    else
        overrides.window_background_opacity = globals.OPACITY
    end
    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("toggle-full-transparent", function(window)
    local overrides = window:get_config_overrides() or {}
    local current_opacity = overrides.window_background_opacity
    if current_opacity == 1.0 then
        overrides.window_background_opacity = 0.0
    else
        overrides.window_background_opacity = 1.0
    end
    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("next-background", function(window)
    local overrides = window:get_config_overrides() or {}
    local count = image_count()

    wezterm.GLOBAL.image_idx = wezterm.GLOBAL.image_idx + 1

    if wezterm.GLOBAL.image_idx > count then
        wezterm.GLOBAL.image_idx = 1
    end

    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("previous-background", function(window)
    local overrides = window:get_config_overrides() or {}
    local count = image_count()

    wezterm.GLOBAL.image_idx = wezterm.GLOBAL.image_idx - 1

    if wezterm.GLOBAL.image_idx == 0 then
        wezterm.GLOBAL.image_idx = count
    end

    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("toggle-background", function(window)
    local overrides = window:get_config_overrides() or {}
    overrides.background = nil
    if wezterm.GLOBAL.use_background == nil or wezterm.GLOBAL.use_background == false then
        wezterm.GLOBAL.use_background = true
    else
        wezterm.GLOBAL.use_background = false
    end

    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("toggle-explicit", function()
    if wezterm.GLOBAL.explicit == nil or wezterm.GLOBAL.explicit == false then
        wezterm.GLOBAL.explicit = true
    else
        wezterm.GLOBAL.explicit = false
    end
end)

wezterm.on("up-opacity", function(window)
    local overrides = window:get_config_overrides() or {}
    local opacity = overrides.window_background_opacity or globals.OPACITY

    opacity = opacity + 0.01
    overrides.window_background_opacity = opacity

    window:set_config_overrides(change_background_opacity(overrides))
end)

wezterm.on("down-opacity", function(window)
    local overrides = window:get_config_overrides() or {}
    local opacity = overrides.window_background_opacity or globals.OPACITY

    opacity = opacity - 0.01
    overrides.window_background_opacity = opacity

    window:set_config_overrides(change_background_opacity(overrides))
end)
