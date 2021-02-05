-- Copyright 2021 Ratheesh <ratheeshreddy@gmail.com>
-- Author: Ratheesh S
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

vim.g.bubbly_statusline = {
  'mode',
  'paste',
  'truncate',
  'path',
  'signify',
  'divisor',


  'current_function',
  'builtinlsp',
  'filetype',
  'progress',
}

vim.g.bubbly_palette = {
  background  = "#383a4c",
  foreground  = "#c5cdd9",
  black       = "#000000",
  red         = "#ec7279",
  green       = "#a0c980",
  yellow      = "#deb974",
  blue        = "#6cb6eb",
  purple      = "#d38aea",
  cyan        = "#5dbbc1",
  white       = "#eeeeee",
  lightgrey   = "#4c5870",
  darkgrey    = "#404247",
  projbg      = "#404247",
  projfg      = "#f5be85",
  brightgreen = "#66d28e",
  cream       = '#EFEAD8',
  hexcharbg   = '#007799',
  curfn_fg    = '#FDC46D',
  yellow1     = '#FDC46D',
  ftbg        = '#B6919E',
  pathbg      = '#1D3CE6',
  pathbg1     = '#7C32C8',
  pathbg2     = '#9f369f',
}

vim.g.bubbly_colors = {
  default = 'red',

  mode = {
    normal      = { background = 'pathbg1', foreground = 'white' },
    insert      = 'green',
    visual      = 'red',
    visualblock = 'red',
    command     = 'red',
    terminal    = 'blue',
    replace     = 'yellow',
    default     = 'white'
  },

  path = {
    project      = { background = 'lightgrey', foreground = 'red' },
    readonly     = { background = 'lightgrey', foreground = 'foreground'  },
    unmodifiable = { background = 'darkgrey', foreground  = 'foreground'  },
    path         = { background = 'cream'   , foreground  = 'pathbg'  },
    modified     = { background = 'lightgrey', foreground = 'foreground'  },
  },

  branch = 'purple',

  signify = {
    added    = 'green',
    modified = 'blue',
    removed  = 'red',
  },

  paste = 'red',

  coc = {
    error   = 'red',
    warning = 'yellow',
    status  = { background = 'lightgrey', foreground = 'foreground'  },
  },

  builtinlsp = {
    diagnostic_count = {
      error   = 'red',
      warning = 'yellow',
    },
    current_function = 'purple',
  },

  current_function = { background = 'lightgrey', foreground = 'curfn_fg'  },
  filetype         = { background = 'ftbg', foreground = 'black'  },

  progress = {
    rowandcol  = { background = 'lightgrey', foreground = 'foreground'  },
    percentage = { background = 'lightgrey', foreground  = 'foreground'  },
    hexchar    = { background = 'hexcharbg', foreground  = 'white'  },
  },

  tabline = {
    active   = 'blue',
    inactive = 'white',
  },
}

vim.g.bubbly_styles = {
  default = '',
  mode = 'bold',
  path = {
    readonly     = '',
    unmodifiable = '',
    project      = '',
    path         = 'italic',
    modified     = '',
  },

  branch = '',
  signify = {
    added    = '',
    modified = '',
    removed  = '',
  },

  paste = 'italic',
  coc = {
    error   = 'bold',
    warning = 'bold',
    status  = 'italic'
  },

  builtinlsp = {
    diagnostic_count = {
      error = '',
      warning = ''
    },
    current_function = 'bold'
  },

  current_function = 'italic',

  filetype = '',
  progress = {
    rowandol   = '',
    percentage = '',
    hexchar    = '',
  },

  tabline = {
    active = 'italic',
    inactive = '',
  },
}

vim.g.bubbly_symbols = {
  default = 'PANIC!',

  path = {
    readonly     = 'RO',
    unmodifiable = '',
    modified     = '[+]',
  },

  signify = {
    added    = '+%s', -- requires 1
    modified = '~%s', -- requires 1
    removed  = '-%s', -- requires 1
  },

  coc = {
    error   = 'E%s', -- requires 1
    warning = 'W%s', -- requires 1
  },

  builtinlsp = {
    diagnostic_count = {
      error   = 'E%s', -- requires 1
      warning = 'W%s', --requires 1
    },
  },
  branch = ' %s', -- requires 1
}

vim.g.bubbly_tags = {
  default = 'HELP ME PLEASE!',

  mode = {
    normal      = 'NORMAL',
    insert      = 'INSERT',
    visual      = 'VISUAL',
    visualblock = 'VISUAL-BLK',
    command     = 'COMMAND',
    terminal    = 'TERMINAL',
    replace     = 'REPLACE',
    default     = 'UNKOWN',
  },
  paste = 'ραstε',
  filetype = {
    noft = 'no ft',
  },
}

