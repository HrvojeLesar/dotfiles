local image_path = "CHANGE ME"

function toggle_effect(pause)
	if pause then
		local lavfi = string.format('lavfi="movie=%s[img]; [img][vid]scale=rw:rh[ovr];"', image_path)
		-- Apply grayscale filter
		mp.set_property("vf", lavfi)
	else
		-- Remove grayscale filter
		mp.set_property("vf", "")
	end
end

-- Observe the pause property and call toggle_effect when it changes
mp.observe_property("pause", "bool", function(name, value)
	toggle_effect(value)
end)
