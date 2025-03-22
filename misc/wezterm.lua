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
-- local act = wezterm.action

return {
  -- font = wezterm.font ('Consolas Nerd Font', { weight = 'Medium'}),
  font = wezterm.font ('Consolas Nerd Font', { weight = 'Medium'}),

  -- font = wezterm.font ('JetBrains Mono', { weight = 'Medium'}),
  -- font = wezterm.font ('CodeSaver Nerd Font', { weight = 'Medium'}),
  font_size = 15.0,

  -- default_prog = { 'C:\\Windows\\System32\\bash.exe', '--login', '-i' },
  enable_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  cursor_thickness = 2,
  underline_position = -4,
  underline_thickness = "250%",
  -- force_reverse_video_cursor = false,

  front_end = "WebGpu",
  max_fps = 120,
  webgpu_power_preference = "HighPerformance",

  ssh_backend = "LibSsh",

  enable_kitty_graphics = true,
  cursor_blink_ease_out = "Constant",
  cursor_blink_ease_in  = "Constant",
  cursor_blink_rate     = 0,
  window_padding = {
      left   = 2,
      right  = 2,
      top    = 15,
      bottom = 0,
  },

  colors = {
    cursor_bg = '#52ad70',
    cursor_fg = 'black',
    cursor_border = '#52ad70',
	},
	ssh_domains = {
    {
      name = 'nnbuild',
      remote_address = '192.168.229.150:9000',
	  username = 'ratheesh',
      ssh_option = {
        identityfile = '~/.ssh/id_rsa.pub',
      },
    },
	},
	audible_bell = "Disabled",
	force_reverse_video_cursor = true,
	warn_about_missing_glyphs = false,
  }
