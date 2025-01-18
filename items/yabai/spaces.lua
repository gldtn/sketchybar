local colors = require("colors")
local settings = require("settings")

local spaces = {}

-- Helper function to add a space item
local function add_space(i)
	local space = sbar.add("space", "space." .. i, {
		space = i,
		icon = { drawing = true },
		label = {
			string = string.format("%02d", i),
			padding_left = 5, -- Adjust padding for two-digit numbers
			padding_right = 10, -- Adjust padding for two-digit numbers
			color = colors.theme.text.dimmed,
			highlight_color = colors.theme.highlight,
			font = {
				family = settings.font.text,
				style = settings.font.style_map["Semibold"],
				size = settings.font.size_map["Medium"],
			},
			align = "center",
		},
		background = {
			height = settings.item.height,
			color = colors.theme.spaces.active_bg,
			border_width = settings.bracket.border_width,
			corner_radius = settings.item.corner_radius,
		},
		popup = {
			background = {
				border_width = settings.popup.border_width,
				border_color = colors.theme.popup.border,
				corner_radius = settings.popup.border_radius,
				drawing = true, -- Enable popup drawing
			},
		},
	})

	-- Add padding space
	sbar.add("space", "space.padding." .. i, {
		space = i,
		script = "",
		width = settings.item.spacing,
	})

	return space
end

-- Helper function to add a popup for a space
local function add_space_popup(space)
	return sbar.add("item", {
		position = "popup." .. space.name,
		background = {
			padding_left = settings.popup.border_width,
			drawing = true,
			image = {
				corner_radius = settings.bar.corner_radius,
				scale = 0.15,
			},
		},
	})
end

-- Subscribe to events for a space
local function subscribe_to_space_events(space, space_popup)
	-- Handle space changes
	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		space:set({
			icon = { highlight = selected },
			label = {
				highlight = selected,
				string = string.format("%02d", tonumber(env.SID)),
			},
			background = {
				color = selected and colors.theme.spaces.active_bg or colors.theme.spaces.inactive_bg,
				border_width = selected and settings.bracket.border_width or 0,
			},
			width = 40, -- Fixed width for simplicity
		})
	end)

	-- Handle mouse clicks
	space:subscribe("mouse.clicked", function(env)
		if env.BUTTON == "other" then
			space_popup:set({ background = { image = "space." .. env.SID } })
			space:set({ popup = { drawing = "toggle" } })
		else
			local op = (env.BUTTON == "right") and "--destroy" or "--focus"
			sbar.exec("yabai -m space " .. op .. " " .. env.SID)
		end
	end)

	-- Handle mouse hover (enter/exit)
	space:subscribe("mouse.entered", function(env)
		space_popup:set({ background = { image = "space." .. env.SID } })
		space:set({ popup = { drawing = "toggle" } })
	end)

	space:subscribe("mouse.exited", function()
		space:set({ popup = { drawing = false } })
	end)
end

-- Add spaces and configure subscriptions
for i = 1, 9 do
	local space = add_space(i)
	local space_popup = add_space_popup(space)

	spaces[i] = space
	subscribe_to_space_events(space, space_popup)
end

-- Observer for space-window updates
local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

-- Add a spacer after the spaces
sbar.add("item", "spaces.spacer", {
	width = settings.item.spacing,
	background = { drawing = false },
})
