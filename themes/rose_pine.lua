local alpha = require("utils.color_utils").with_alpha

local p = {
	base = "191724",
	bg_alt = "2a283e", -- highlight_low (var: moon)
	surface = "1f1d2e",
	overlay = "26233a",
	muted = "6e6a86",
	subtle = "908caa",
	text = "e0def4",
	gold = "f6c177",
	love = "eb6f92",
	rose = "ebbcba",
	pine = "31748f",
	foam = "9ccfd8",
	iris = "c4a7e7",
	highlight_low = "21202e",
	highlight_med = "403d52",
	highlight_high = "524f67",
}

return {
	highlight = p.rose, -- spaces & front_app icon
	accent = {
		primary = p.foam,
		secondary = p.rose,
	},
	widgets = {
		-- notification widget icons
		label_muted = p.muted,
		label_highlight = p.text,
		messages = {
			unread = p.foam,
			read = p.muted,
		},
		mail = {
			unread = p.rose,
			read = p.muted,
		},
		brew = {
			outdated = p.iris,
			updated = p.muted,
		},
		-- others
		weather = p.rose,
		network = {
			connected = p.pine,
			disconnected = p.love,
		},
		volume = {
			slider = {
				bg = p.base,
				knob = p.text,
				bar = p.pine,
			},
		},
	},
	icon = {
		vibrant = p.rose,
		vivid = p.text,
		subtle = p.subtle,
		dimmed = p.muted,
		muted = p.highlight_med,
	},
	text = {
		vibrant = p.text,
		vivid = p.text,
		subtle = p.subtle,
		dimmed = p.muted,
		muted = p.highlight_med,
	},
	bg = {
		primary = p.base,
		secondary = p.surface,
		tertiary = p.overlay,
	},
	bracket = {
		bg = p.bg_alt,
		border = p.base,
	},
	popup = {
		bg = p.surface,
		border = p.overlay,
	},
	bar = {
		bg = alpha(tonumber(p.base, 16), 1), -- You can add transparency here (e.g 0.90)
		border = p.base,
	},
}
