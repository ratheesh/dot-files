-- feline.nvim customization

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

-- local is_project_valid = false

local colors = {
  dark      = '#000000',
  black     = '#303040',
  bblack    = '#928374',
  bred      = '#ec5f67',
  pink      = '#F80069',
  purple    = "#d38aea",
  bgreen    = '#99c794',
  green1    = '#66d28e',
  grey      = '#909090',
  bgrey     = "#4c5870",
  yellow    = '#f99157',
  byellow   = '#deb974',
  bblue     = '#6cb6eb',
  magenta   = '#D85A93',
  bmagenta  = '#d3869b',
  cyan      = '#729FCF',
  bcyan     = '#47A4A5',
  white     = '#cccccc',
  bwhite    = '#ebdbb2',
  projbg    = "#89B7B5",
  projfg    = "#000000",
  cream     = '#EFEAD8',

  background  = "#383a4c",
  foreground  = "#c5cdd9",
  red         = "#ec5f67",
  green       = "#99c794",
  yellow1     = "#deb974",
  blue        = "#6cb6eb",
  lightgrey   = "#4c5870",
  darkgrey    = "#404247",
  brightgreen = "#66d28e",
  hexcharbg   = '#007799',
  curfn_fg    = '#FDC46D',
  ftbg        = '#B6919E',
  ftbg1       = '#8F7C76',
  pathbg1     = '#7C32C8',
  pathbg2     = '#9f369f',
  modifiedfg  = '#5CD96F',

  mode_normal  = "#d38aea",
  mode_insert  = '#4eb899',
  mode_visual  = '#E0AF8F',
  mode_select  = "#AE8A7E",
  mode_replace = '#d65b84'
}

-- local mode_alias = {
--   ['n']  = 'NORMAL',
--   ['no'] = 'N·Operator Pending',
--   ['ni'] = '(INSERT)',
--   ['v']  = 'VISUAL',
--   ['V']  = 'V·LINE',
--   [''] = 'V·BLOCK',
--   ['s']  = 'SELECT',
--   ['S']  = 'S·LINE',
--   [''] = 'S·BLOCK',
--   ['i']  = 'INSERT',
--   ['ic'] = 'INS-COMPLETE',
--   ['ix'] = 'INSERT',
--   ['R']  = 'REPLACE',
--   ['Rv'] = 'V·REPLACE',
--   ['c']  = 'COMMAND',
--   ['cv'] = 'VIM Ex',
--   ['ce'] = 'Ex',
--   ['r']  = 'PROMPT',
--   ['rm'] = 'MORE',
--   ['r?'] = 'CONFIRM',
--   ['!']  = 'SHELL',
--   ['t']  = 'TERMINAL'
-- }

local mode_color = {
  ['n']  = colors.mode_normal,
  ['ni'] = colors.mode_normal,
  ['no'] = colors.mode_normal,
  ['i']  = colors.mode_insert,
  ['ic'] = colors.mode_insert,
  ['v']  = colors.mode_visual,
  ['V']  = colors.mode_visual,
  [''] = colors.mode_visual,
  ['c']  = colors.purple,
  ['s']  = colors.mode_select,
  ['S']  = colors.mode_select,
  [''] = colors.mode_select,
  ['R']  = colors.mode_replace,
  ['Rv'] = colors.mode_replace,
  ['cv'] = colors.red,
  ['ce'] = colors.red,
  ['r']  = colors.cyan,
  ['rm'] = colors.cyan,
  ['r?'] = colors.cyan,
  ['!']  = colors.red,
  ['t']  = colors.red,
}

local components = {
  left = {
    active = {},
    inactive = {}
  },
  right = {
    active = {},
    inactive = {}
  }
}

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'fugitive',
  'fugitiveblame'
}

table.insert(components.left.active, {
  provider = function()
    return vi_mode_utils.get_vim_mode()
  end,
  hl = {
    fg = colors.black,
    bg = mode_color[vim.fn.mode()],
  },
  right_sep = '',
  left_sep = '',
  -- Component info here
})
-- components.left.active[1] = {
--  }

table.insert(components.left.active, {
  provider = function() return string.format(' ') end,
})

table.insert(components.left.active, {
  is_project_valid = vim.call('utils#getprojectname'),
  provider = function() return string.format('%s', vim.call('utils#getprojectname')) end,
  hl = {
    fg = colors.projfg,
    bg = colors.projbg,
  },
  right_sep = '',
  left_sep = '',
})

table.insert(components.left.active, {
  provider = 'file_info',
  hl = {
    fg = colors.cream,
    bg = colors.bgrey,
    style = 'italic'
  },
  left_sep = {'', 'left_rounded'},
  right_sep = {'right_rounded', ' '}
})

table.insert(components.left.active, {
  provider = 'git_diff_added',
  hl = {
    fg = colors.bgreen,
    bg = colors.black,
  }
})

table.insert(components.left.active, {
  provider = 'git_diff_changed',
  hl = {
    fg = colors.bmagenta,
    bg = colors.black,
  }
})

table.insert(components.left.active, {
  provider = 'git_diff_removed',
  hl = {
    fg = colors.bred,
    bg = colors.black,
  }
})
----------------------------------------- right segment ----------------------------------------

table.insert(components.right.active, {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = colors.red,
    bg = colors.black,
  }
})

table.insert(components.right.active, {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = colors.cyan,
    bg = colors.black,
  }
})

table.insert(components.right.active, {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = colors.cyan,
    bg = colors.black,
  }
})

table.insert(components.right.active, {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = colors.cyan,
    bg = colors.black,
  }
})

table.insert(components.right.active, {
  provider = function()
    local msg = ''
    msg = msg or 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end

    for _,client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
        return string.format('  %s ',client.name)
      end
    end
    return msg
  end,

  hl = {
    fg = colors.white,
    bg = colors.black,
  }
})

table.insert(components.right.active, {
  provider = function() return string.format(' ') end,
  hl = {
    bg = colors.black,
  },
})

table.insert(components.right.active, {
  provider = 'file_type',
  hl = {
    fg = 'white',
    bg = 'oceanblue',
  },

  left_sep = {
    str = '█',
  },

  right_sep = {
    {
      str = '█',
    },
    ''
  }
})

table.insert(components.right.active, {
  provider = function()
    local sw = vim.bo.shiftwidth
    local et = vim.bo.expandtab
    local im=''
    if et == true then
      im='•'
    else
      im='▸'
    end
    return string.format(' %s%s≡ ', sw, im)
  end,

  hl = {
    fg = colors.blue,
    bg = colors.bgrey,
  },
})

table.insert(components.right.active, {
  provider = function()
    return string.format('≡%d:%d', vim.fn.line('.'), vim.fn.col('.'))
  end,

  hl = {
    fg = colors.black,
    bg = colors.ftbg,
  },
  left_sep  = '█',
  right_sep = '█'
})

table.insert(components.right.active, {
  provider = 'line_percentage',
  hl = {
    fg = colors.yellow,
    bg = colors.bgrey,
  },
  left_sep = '█',
  right_sep = '█'
})

table.insert(components.right.active, {
  provider = 'scroll_bar',
  hl = {
    fg = colors.ftbg,
    bg = colors.black
  },
})

-- setup actual status line
require('feline').setup({
  default_fg = colors.white,
  default_bg = colors.black,

  components = components,
  properties = properties
})

-- End of File
