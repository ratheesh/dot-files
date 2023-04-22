-- place it in C:\Program Files\wezterm\ folder
local wezterm = require 'wezterm'

return {
  font = wezterm.font ('Consolas Nerd Font'),
  font_size = 12.0,
  default_prog = { 'C:\\Windows\\System32\\bash.exe', '--login', '-i' },
  enable_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  cursor_thickness = 3,
  underline_position = -3,
  underline_thickness = "200%",
  -- force_reverse_video_cursor = false,
  ssh_backend = "LibSsh",
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
  -- font_hinting = "Full"
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
  -- font = wezterm.font('Consolas Nerd Font', { weight = 'Normal', italic = true }),
}
