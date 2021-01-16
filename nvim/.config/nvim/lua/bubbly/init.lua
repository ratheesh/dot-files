
vim.g.bubbly_statusline = {
  'mode',
  'truncate',
  'path',
  'signify',
  'divisor',


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
  white       = "#c5cdd9",
  lightgrey   = "#4c5870",
  darkgrey    = "#404247",
  projbg      = "#404247",
  projfg      = "#f5be85",
  brightgreen = "#66d28e",
  cream       = '#EFEAD8',
  hexcharbg   = '#00707B',
}

vim.g.bubbly_colors = {
  default = 'red',

  mode = {
    normal      = 'cyan',
    insert      = 'green',
    visual      = 'red',
    visualblock = 'red',
    command     = 'red',
    terminal    = 'blue',
    replace     = 'yellow',
    default     = 'white'
  },

  path = {
    project      = { background = 'lightgrey', foreground = 'purple' },
    readonly     = { background = 'lightgrey', foreground = 'foreground'  },
    unmodifiable = { background = 'darkgrey', foreground  = 'foreground'  },
    path         = { background = 'cream'   , foreground  = 'black'  },
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

  filetype = 'blue',

  progress = {
    rowandcol  = { background = 'lightgrey', foreground = 'foreground'  },
    percentage = { background = 'lightgrey', foreground  = 'foreground'  },
    hexchar    = { background = 'hexcharbg', foreground  = 'foreground'  },
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
    project      = 'italic',
    path         = '',
    modified     = '',
  },

  branch = '',
  signify = {
    added    = '',
    modified = '',
    removed  = '',
  },

  paste = 'bold',
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
    modified     = '+',
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
  branch = ' %s' -- requires 1
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
  paste = 'PASTE',
  filetype = {
    noft = 'no ft',
  },
}

