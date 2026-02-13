local image_path = "CHANGE ME"

function toggle_effect(pause)
    if pause then
        local lavfi = string.format('lavfi="movie=%s[img]; [img][vid]scale=rw:rh[ovr];"', image_path)
        mp.set_property("vf", lavfi)
    else
        mp.set_property("vf", "")
    end
end

local init = mp.get_opt("bg") or nil

if init == "y" then
    mp.observe_property("pause", "bool", function(name, value)
        toggle_effect(value)
    end)
end


local function set_opacity(value)
    os.execute("hyprctl dispatch setprop class:mpv opacity " .. value)
end

local init_transparent = mp.get_opt("transparent") or nil
if init_transparent == "y" then
    mp.observe_property("pause", "bool", function(name, paused)
        if paused then
            os.execute("hyprctl dispatch tagwindow -- +transparent class:mpv")
        else
            os.execute("hyprctl dispatch tagwindow -- -transparent class:mpv")
        end
    end)
end
