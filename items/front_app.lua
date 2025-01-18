local colors = require("colors")
local settings = require("settings")

-- Query the current space ID
local space_id = sbar.exec("yabai -m query --windows --window | jq -r '.space'")

-- Create the front app item
local front_app = sbar.add("item", "front_app", {
	label = {
		drawing = true,
		color = colors.theme.highlight,
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Semibold"],
			size = settings.font.size_map["Medium"],
		},
	},
	icon = {
		background = {
			drawing = true,
			image = {
				scale = 0.8,
				padding_right = settings.item_padding,
			},
		},
	},
	updates = true,
	space = space_id,
})

-- Event: Front app switched
front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		icon = {
			background = {
				image = "app." .. env.INFO,
				-- scale = 1.0, -- Adjust scale as needed
				-- resolution = "16x16",
			},
		},
		label = {
			drawing = true,
			string = env.INFO,
		},
		space = space_id,
	})
end)

-- Event: Mouse clicked
front_app:subscribe("mouse.clicked", function()
	sbar.trigger("swap_menus_and_spaces")
end)

-- Add a spacer after the front app
sbar.add("item", "front_app.spacer", {
	width = settings.item_spacing,
	background = { drawing = false },
})

return front_app
