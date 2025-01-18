local color_utils = require("utils.color_utils")

-- Set your theme
-- make sure it exists inside `themes/` folder
local theme = "catppuccin"

local colors = {
	theme = require("themes." .. theme),
	with_alpha = color_utils.with_alpha,

	popup = {
		bg = 0xcc2e3440, -- Nord1 transparent 80%
		border = 0xffa3be8c, -- Nord14
	},
	spaces = {
		-- active = 0xffffffff, -- Nord2
		active = 0xff2e3440, -- Nord1
		inactive = 0x002e3440, -- Nord0 with transparency
	},
}

color_utils.preprocess_colors(colors.theme)

return colors
