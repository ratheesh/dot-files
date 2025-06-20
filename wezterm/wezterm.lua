-- Copyright (c) 2025 Ratheesh <ratheeshreddy@gmail.com>
-- Author: Ratheesh S
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so,
-- subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
-- COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
-- CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Installation
-- Windows: Place it in C:\Program Files\wezterm\ folder
-- Linux:   Place it in $HOME/.config/wezterm/ folder
local wezterm = require 'wezterm'

return {
  -- font = wezterm.font ('Consolas Nerd Font', { weight = "Regular"}),
  -- font = wezterm.font ('Maple Mono NF', { weight = 'Medium'}),

  -- fallback fonts
  font = wezterm.font_with_fallback({
      { family = "Consolas Nerd Font", weight = "Regular", scale = 1.01 },
      -- { family = "Maple Mono NF"  , weight = "Medium", scale = 1.00 },
      { family = "Symbols Nerd Font" , scale = 1.00 },
  }),
  font_size = 15.25,

  -- default_prog = { 'C:\\Windows\\System32\\bash.exe', '--login', '-i' },

  term='wezterm',
  -- use_cap_height_to_scale_fallback_fonts = true,
  -- font_hinting = "Full",
  -- freetype_load_flags = 'NO_BITMAP',
  enable_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  cursor_thickness = 2,
  underline_position = -2,
  underline_thickness = "250%",
  -- line_height=1.1,
  line_width=1.1,
  adjust_window_size_when_changing_font_size = false,
  allow_square_glyphs_to_overflow_width = "Always",
  -- force_reverse_video_cursor = false,

  enable_wayland = true,
  front_end = "OpenGL"; --"WebGpu",
  webgpu_power_preference = "HighPerformance",

  ssh_backend = "LibSsh",

  enable_kitty_graphics = true,
  -- cursor_blink_ease_out = "Constant",
  -- cursor_blink_ease_in  = "Constant",
  -- cursor_blink_rate     = 0,
  window_padding = {
      left   = 3,
      right  = 1,
      top    = 2,
      bottom = 2,
  },

  visual_bell = {
      fade_in_function = "Constant",
      fade_in_duration_ms  = 0,
      fade_out_function = "Constant",
      fade_out_duration_ms = 0,
  },

  colors = {
    cursor_bg = '#52ad70',
    cursor_fg = 'black',
    cursor_border = '#52ad70',
	},
	ssh_domains = {
    --[[ {
      name = 'xxxxxx',
      remote_address = '192.168.XXX.XXX:XXXX',
	  username = 'xxxxxxxx',
      ssh_option = {
        identityfile = '~/.ssh/id_xxx.pub',
      },
    }, ]]
	},
	audible_bell = "Disabled",
	force_reverse_video_cursor = true,
	warn_about_missing_glyphs = false,
  }
