local wezterm = require 'wezterm'
local act = wezterm.action 

return {
    -- Functionality:
    default_prog = {'/usr/bin/zsh'},
    enable_wayland = false,
    term = 'wezterm',

    disable_default_key_bindings = true,
    keys = {
        -- paste from the primary selection 
        { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
        -- paste from the clipboard
        { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
        -- copy from clipboard 
        { key = 'C', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection' },
    },

    -- GUI themes:
    enable_tab_bar = false,
    hide_mouse_cursor_when_typing = true,
    window_background_opacity = 0.90,
    text_background_opacity = 0.70,
    color_scheme = 'Vice Dark (base16)',
        -- Afterglow, Andromeda, Vice Dark (base16), VSCodeDark+ (Gogh), duckbones, Dracula+
    font_size = 12.0,
    font = wezterm.font_with_fallback {
        'JetBrains Mono', 
        'Fira Code',
    },
    default_cursor_style = 'BlinkingUnderline',
    text_blink_rate = 300,
}
