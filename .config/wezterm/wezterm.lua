local wt = require("wezterm")
return {
    color_scheme = 'tokyonight',
    font = wt.font "Fira Code",
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
