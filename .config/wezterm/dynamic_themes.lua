local wezterm = require("wezterm")

-- Creates a lua table containing the name of every color scheme WezTerm
-- ships with.
local scheme_names = {}
for name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
	table.insert(scheme_names, name)
end

-- When the config for a window is reloaded (i.e. when you save this file
-- or open a new window)...
wezterm.on("window-config-reloaded", function(window, pane)
	-- Don't proceed if the config has already been overriden, otherwise
	-- we'll enter an infinite loop of neverending colour scheme changes.
	-- If that sounds like your kinda thing, then remove this line ;) - but
	-- don't say you haven't been warned.
	if window:get_config_overrides() then
		return
	end
	-- Pick a random colour scheme name.
	local scheme = scheme_names[math.random(#scheme_names)]
	-- Assign it as an override for this window.
	window:set_config_overrides({ color_scheme = scheme })
	-- And log it for good measure
	wezterm.log_info("Your colour scheme is now: " .. scheme)
end)
