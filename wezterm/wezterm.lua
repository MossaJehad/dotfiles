-- =====================================
-- WezTerm Configuration
-- =====================================

local wezterm = require("wezterm")

-- Use the config builder for better defaults
local config = wezterm.config_builder()

-- =====================================
-- GENERAL
-- =====================================

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.default_cursor_style = "BlinkingBar"

-- =====================================
-- APPEARANCE
-- =====================================

config.color_scheme = "Mashup Colors (terminal.sexy)"

config.font = wezterm.font("FiraCode Nerd Font", {
  weight = "Regular",
})

config.font_size = 12.5

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

-- Transparency
config.window_background_opacity = 0.85

-- macOS-only blur
if wezterm.target_triple:find("apple") then
  config.macos_window_background_blur = 10
end

-- =====================================
-- KEYBINDINGS
-- =====================================

config.keys = {
  -- Split panes
  {
    key = "s",
    mods = "CTRL|ALT",
    action = wezterm.action.SplitHorizontal {
      domain = "CurrentPaneDomain",
    },
  },
  {
    key = "s",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical {
      domain = "CurrentPaneDomain",
    },
  },

  -- Pane navigation
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },

  -- New window
  {
    key = "n",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SpawnCommandInNewWindow {
      args = { os.getenv("SHELL") or "/bin/bash" },
    },
  },

  -- Close current pane (no prompt)
  {
    key = "e",
    mods = "CTRL",
    action = wezterm.action.CloseCurrentPane {
      confirm = false,
    },
  },
}

-- =====================================
-- MOUSE
-- =====================================

-- Right-click:
-- - Copy if selection exists
-- - Paste otherwise
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action_callback(function(window, pane)
      local selection = window:get_selection_text_for_pane(pane)
      if selection and selection ~= "" then
        window:perform_action(
          wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
          pane
        )
      else
        window:perform_action(
          wezterm.action.PasteFrom("Clipboard"),
          pane
        )
      end
    end),
  },
}

-- =====================================
-- RETURN CONFIG
-- =====================================

return config

