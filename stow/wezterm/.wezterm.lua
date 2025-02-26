
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = 'Bold'})
config.font_size = 24

config.enable_tab_bar = false

config.color_scheme = 'Everforest Dark (Gogh)'
return config
