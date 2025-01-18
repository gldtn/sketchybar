local colors = require("colors")

return {
	paddings = 3,
	group_paddings = 6,
	group_spacing = 4,

	bar = {
		height = 36,
		margin = 0,
		padding = 0,
		blur_radius = 0,
		corner_radius = 0,
		margin_padding = 18,
	},

	bracket = {
		height = 28,
		border_width = 1,
		corner_radius = 4,
		color = colors.theme.bracket.bg,
		border_color = colors.theme.bracket.border,
	},

	item = {
		height = 26,
		padding = 6,
		corner_radius = 4,
		spacing = 4,
	},

	popup = {
		border_width = 2,
		border_radius = 4,
		blur_radius = 6,
		y_offset = 0,
		padding = 16,
		image_padding = 0,
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
}
