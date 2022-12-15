local wezterm = require("wezterm")

-- local launch_menu = {}
-- local default_shell = "/bin/zsh"
local padding = {
  left = "0cell",
  right = "0cell",
  top = "0cell",
  bottom = "0cell",
}

-- Reload the configuration every ten minutes
-- wezterm.time.call_after(600, function()
--   wezterm.reload_configuration()
-- end)

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
  local names = { name }
  return wezterm.font_with_fallback(names, params)
end

-- local function get_theme()
--   local _time = os.date("*t")
--   if _time.hour >= 1 and _time.hour < 9 then
--     return "Rosé Pine (base16)"
--   elseif _time.hour >= 9 and _time.hour < 17 then
--     return "tokyonight_night"
--   elseif _time.hour >= 17 and _time.hour < 21 then
--     return "Catppuccin Mocha"
--   elseif _time.hour >= 21 and _time.hour < 24 or _time.hour >= 0 and _time.hour < 1 then
--     return "kanagawabones"
--   end
-- end

return {
  bidi_enabled = true,
  bidi_direction = "AutoLeftToRight",
  color_scheme = "tokyonight_night",
  font = font_with_fallback({
    family = "JetBrains Mono NF",
    harfbuzz_features = {
      "zero",
    },
  }),
  font_rules = {
    {
      intensity = "Bold",
      font = font_with_fallback({
        family = "JetBrains Mono NF",
        harfbuzz_features = {
          "zero",
        },
        weight = "Medium",
      }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback({
        family = "JetBrains Mono NF",
        -- family = "Dank Mono",
        weight = "Medium",
        italic = true,
      }),
    },
    {
      italic = true,
      font = font_with_fallback({
        -- family = "Dank Mono",
        family = "JetBrains Mono NF",
        weight = "Regular",
        italic = true,
      }),
    },
  },

  initial_cols = 128,
  initial_rows = 32,
  use_dead_keys = false,
  window_padding = padding,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  selection_word_boundary = " \t\n{}[]()\"'`,;:@",
  line_height = 1.00,
  font_size = 10,
  window_background_opacity = 1.00,
  bold_brightens_ansi_colors = true,
  tab_bar_at_bottom = true,

  -- fancy_tab_bar
  fancy_tab_bar = true,
  window_frame = {
    font = font_with_fallback({
      family = "JetBrains Mono NF",
      harfbuzz_features = {
        "zero",
      },
    }),
    font_size = 10.0,
    active_titlebar_bg = "#0e0e14",
    inactive_titlebar_bg = "#0e0e14",
  },
  colors = {
    tab_bar = {
      inactive_tab_edge = "#33467c",
      active_tab = {
        bg_color = "#1a1b26",
        fg_color = "#c0caf5",
      },
      inactive_tab = {
        bg_color = "#0e0e14",
        fg_color = "#c0caf5",
      },
      new_tab = {
        bg_color = "#0e0e14",
        fg_color = "#c0caf5",
      },
    },
  },
}
