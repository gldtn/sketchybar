local color_utils = require("utils.color_utils")

-- Set your theme
-- make sure it exists inside `themes/` folder
local theme = "catppuccin"

local colors = {
	theme = require("themes." .. theme),
	with_alpha = require("utils.color_utils").with_alpha,
}

color_utils.preprocess_colors(colors.theme)

return colors
