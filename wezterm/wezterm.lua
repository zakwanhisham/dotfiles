local wezterm = require("wezterm")

local padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell",
}

-- A helper function for fallback fonts
local function font_with_fallback(name, params)
  local names = { name }
  return wezterm.font_with_fallback(names, params)
end

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
                weight = "Medium",
                italic = true,
            }),
        },
        {
            italic = true,
            font = font_with_fallback({
                family = "JetBrains Mono NF",
                weight = "Regular",
                italic = true,
            }),
        },
    },
    initial_cols = 1920,
    initial_rows = 1080,
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
    max_tab_width = 8,
    window_frame = {
        font = font_with_fallback({
            family = "JetBrains Mono NF",
            harfbuzz_features = {
                "zero",
            },
        }),
        font_size = 10.0,
        active_titlebar_bg = "#0e0e14",
        inactive_titlebar_bg = "#1a1b26",
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
