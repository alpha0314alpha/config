local wezterm = require 'wezterm' local config = wezterm.config_builder()
config.automatically_reload_config = true

-- 起動シェル
config.default_prog = { "powershell.exe"  }

-- 起動メニュー（タブ内でMINGW64）
config.launch_menu = {
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

-- フォント
config.font = wezterm.font_with_fallback({
})

-- 見た目
-- config.color_scheme = 'Monokai'
config.font_size = 10
config.macos_window_background_blur = 20
config.window_background_opacity = 0.75
-- config.win32_system_backdrop = "Acrylic"
config.window_decorations = "RESIZE"
-- config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false
-- config.show_tabs_in_tab_bar = false


config.window_background_gradient = {
    colors = { "#000000" },
}

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

-- 動作
config.exit_behavior = "Close"
return config
