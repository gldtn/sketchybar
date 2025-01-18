local colors = require("colors")

return {
	paddings = 3,
	group_paddings = 6,

	bracket = {
		height = 28,
		border_width = 1,
		corner_radius = 4,
		color = colors.theme.bracket.bg,
		border_color = colors.theme.bracket.border,
	},

	icons = "nerdfont", -- alternatively available: NerdFont

	-- This is a font configuration for SF Pro and SF Mono (installed manually)
	font = {
		-- default = {},
		text = "SF Pro", -- Used for text
		numbers = "SF Mono", -- Used for numbers
		icons = "Symbols Nerd Font Mono", -- Used for icons

		-- Font style map
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Semibold",
			["Bold"] = "Bold",
			["Heavy"] = "Heavy",
			["Black"] = "Black",
		},

		-- Font size map
		size_map = {
			["Small"] = 12.0,
			["Medium"] = 14.0,
			["Large"] = 16.0,
		},
	},

	-- bar_height = 33,
	-- bar_corner_radius = 0,
	-- bar_padding = 0,
	-- bar_margin = 0,
	-- bar_blur_radius = 0,
	bar_margin_padding = 18,

	item_height = 28,
	item_padding = 6,
	item_corner_radius = 4,
	item_spacing = 6,

	group_spacing = 4,
	popup_border_width = 2,
	popup_border_radius = 4,
	popup_blur_radius = 6,
	-- popup_y_offset = 4,
	popup_y_offset = 0,
	popup_padding = 16,
	popup_image_padding = 0,
}
