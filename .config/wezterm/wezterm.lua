--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.use_fancy_tab_bar = false
config.window_background_opacity = 0.8

-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
-- local mux = wezterm.mux
-- 
-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

local act = wezterm.action

config.keys = {
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = act.ShowTabNavigator,
  },
  {
      key = ',',
      mods = 'CMD',
      action = act.SpawnCommandInNewTab {
        cwd = os.getenv('WEZTERM_CONFIG_DIR'),
        set_environment_variables = {
          TERM = 'screen-256color',
        },
        args = {
          '/usr/bin/nvim',
          os.getenv('WEZTERM_CONFIG_FILE'),
        },
      },
    },
  -- other keys
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
