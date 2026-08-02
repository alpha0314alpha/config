local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.automatically_reload_config = true

-- 襍ｷ蜍輔す繧ｧ繝ｫ
config.default_prog = {
    "wsl.exe",
    "-d",
    "Ubuntu"
}

-- 襍ｷ蜍輔Γ繝九Η繝ｼ・医ち繝門・縺ｧMINGW64・・
config.launch_menu = {
    {
        label = "WSL Ubuntu",
        args = {
            "wsl.exe",
            "-d",
            "Ubuntu",
        },
    },
    {
        label = "MSYS2 MINGW64",
        args = {
            "C:\\msys64\\usr\\bin\\bash.exe",
            "--login",
            "-i",
        },
        set_environment_variables = {
            MSYSTEM = "MINGW64",
        },
    },
    {
        label = "MSYS2 UCRT64",
        args = {
            "C:\\msys64\\usr\\bin\\bash.exe",
            "--login",
            "-i",
        },
        set_environment_variables = {
            MSYSTEM = "UCRT64",
        },
    },
    {
        label = "Git bash",
        args = {
            "C:\\Program Files\\Git\\bin\\bash.exe",
            "--login",
            "-i",
        },
    },
}
-- 繝輔か繝ｳ繝・
config.font = wezterm.font_with_fallback({
})

-- 隕九◆逶ｮ
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Monokai'
config.font_size = 10
config.use_ime = true
config.macos_window_background_blur = 10
-- config.window_background_opacity = 0.8
-- config.win32_system_backdrop = "Acrylic"
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false
-- config.show_tabs_in_tab_bar = false

-- 閭梧勹逕ｻ蜒・
config.background = {
    {
        source = {
            File = "C:/Users/admin/Pictures/___kawayo.jpg"
        },
        opacity = 1,
        width = "Cover",
        height = "Cover",
        horizontal_align = "Center",
        vertical_align = "Middle",
        repeat_x = "NoRepeat",
        repeat_y = "NoRepeat",
    },
}

config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
}

-- config.window_background_gradient = {
--     colors = { "#111111" },
-- }

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_lower_left_triangle
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#505050"
    local foreground = "#FFFFFF"
    local edge_background = "none"
    if tab.is_active then
        background = "#00BB00"
        foreground = "#FFFFFF"
    end
    local edge_foreground = background
    local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 3) .. "   "
    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
    }
end)

-- 蜍穂ｽ・
config.exit_behavior = "Close"
config.canonicalize_pasted_newlines = "LineFeed"
return config
