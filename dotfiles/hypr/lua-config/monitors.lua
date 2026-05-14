-- Larger left, smaller right
hl.monitor({
	output = "DP-4",
	mode = "2560x1440@164.96",
	position = "0x0",
	scale = "1",
})
hl.monitor({
	output = "HDMI-A-2",
	mode = "1920x1080@60.0",
	position = "2560x180",
	scale = "1",
})

-- Smaller left, larger right
-- hl.monitor({
-- 	output = "HDMI-A-2",
-- 	mode = "1920x1080@60.0",
-- 	position = "0x180",
-- 	scale = "1",
-- })
-- hl.monitor({
-- 	output = "DP-4",
-- 	mode = "2560x1440@164.96",
-- 	position = "1920x0",
-- 	scale = "1",
-- })

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
