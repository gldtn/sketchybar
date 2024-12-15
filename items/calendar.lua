local settings = require("settings")

-- toggle UserNotificationCenter;
-- You will need to set a shortcut a set the keycode below (currently set to f8(keycode `100`))
local click_script_template = [[osascript -e 'tell application "System Events" to key code 100']]

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

-- Calendar item configuration
local cal = sbar.add("item", "calendar.item", {
	icon = {
		font = {
			family = settings.font.text,
			size = settings.font.size_map["Small"],
			style = settings.font.style_map["Semibold"],
		},
	},
	label = {
		width = 64,
		align = "right",
		font = { style = settings.font.style_map["Semibold"] },
	},
	update_freq = 30,
	position = "right",
	click_script = string.format(click_script_template),
})

sbar.add("bracket", "widgets.calendar.bracket", { "calendar.item" }, {
	background = {
		color = settings.bracket.color,
		height = settings.bracket.height,
		border_color = settings.bracket.border_color,
		border_width = settings.bracket.border_width,
		corner_radius = settings.bracket.corner_radius,
	},
	-- popup = { align = "center" },
})

sbar.add("item", "widgets.calendar.padding", {
	position = "right",
	width = settings.group_paddings,
})

-- Subscribe to events to update the calendar dynamically
---@diagnostic disable-next-line: unused-local
cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({
		icon = os.date("􀉉  %a. %b. %d,"), -- Example: "Mon. Nov. 27,"
		label = os.date("%I:%M %p"), -- Example: "12:34 PM"
	})
end)
