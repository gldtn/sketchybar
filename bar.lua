local colors = require("colors")
local settings = require("settings")

-- Equivalent to the --bar domain
sbar.bar({
	-- sticky = on,
	-- position = top,
	height = settings.bar.height,
	margin = settings.bar.margin,
	color = colors.theme.bar.bg,
	padding_right = settings.bar.padding,
	padding_left = settings.bar.padding,
	corner_radius = settings.bar.corner_radius,
	blur_radius = settings.bar.blur_radius,
	y_offset = settings.bar.margin,
})
