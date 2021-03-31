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

local gl         = require('galaxyline')
local gls        = gl.section
local condition  = require('galaxyline.condition')
local vcs        = require('galaxyline.provider_vcs')
local buffer     = require('galaxyline.provider_buffer')
local fileinfo   = require('galaxyline.provider_fileinfo')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient  = require('galaxyline.provider_lsp')
local icons      = require('galaxyline.provider_fileinfo').define_file_icon()

-----------------------
local function get_basename(file)
  return file:match("^.+/(.+)$")
end

local GetGitRoot = function()
  local git_dir = require('galaxyline.provider_vcs').get_git_dir()
  if not git_dir then return '' end

  local git_root = git_dir:gsub('/.git/?$','')
  return get_basename(git_root)
end
----------------------
local colors = {
  dark      = '#000000',
  black     = '#383a4c',
  bblack    = '#928374',
  red       = '#cc241d',
  bred      = '#ec5f67',
  pink      = '#F80069',
  purple    = "#d38aea",
  green     = '#98971a',
  bgreen    = '#99c794',
  green1    = '#66d28e',
  grey      = '#909090',
  bgrey     = "#4c5870",
  yellow    = '#f99157',
  byellow   = '#deb974',
  blue      = '#0365E6',
  bblue     = '#6cb6eb',
  magenta   = '#D85A93',
  bmagenta  = '#d3869b',
  cyan      = '#729FCF',
  bcyan     = '#47A4A5',
  white     = '#cccccc',
  bwhite    = '#ebdbb2',
  projbg    = "#005f8f",
  projfg    = "#f5be85",
  cream     = '#EFEAD8',
}

icons['man'] = {colors.green, ''}

gls.left = {
  {
    Mode = {
      provider = function()
        local alias = {
          n    = 'NORMAL',
          i    = 'INSERT',
          c    = 'COMMAND',
          v    = 'VISUAL',
          V    = 'VISUAL',
          [''] = 'VISUAL',
          s    = 'SUBSTITUTE',
          S    = 'S-LINE',
        }

        if not condition.hide_in_width() then
          alias = {n = 'N', i = 'I', c = 'C', V= 'V', [''] = 'V'}
        end

        local mode_color = {
          n      = colors.purple,
          i      = colors.green1,
          v      = colors.blue,
          ['']   = colors.blue,
          V      = colors.blue,
          c      = colors.purple,
          no     = colors.magenta,
          s      = colors.orange,
          S      = colors.orange,
          [''] = colors.orange,
          ic     = colors.yellow,
          R      = colors.red,
          Rv     = colors.red,
          cv     = colors.red,
          ce     = colors.red,
          r      = colors.cyan,
          rm     = colors.cyan,
          ['r?'] = colors.cyan,
          ['!']  = colors.red,
          t      = colors.red,
        }
        vim.api.nvim_command('hi GalaxyMode guibg='..mode_color[vim.fn.mode()])
        return string.format('  %s ', alias[vim.fn.mode()])
      end,
      highlight = {colors.black, colors.yellow, 'bold'},
    }
  },
  {
    BlankSpace = {
      provider = function() return ' ' end,
      highlight = {colors.red, colors.black}
    }
  },
  -- {
  --   GitIcon = {
  --     provider = function() return '   ' end,
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.black, colors.bblack}
  --   }
  -- },
  -- {
  --   GitBranch = {
  --     provider = function() return string.format('%s ', vcs.get_git_branch()) end,
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.black, colors.bblack}
  --   }
  -- },
  {
    GitRoot = {
      -- provider = function() return string.format('  [%s] ', GetGitRoot()) end,
      provider = function() return string.format('  %s ', vim.call('utils#getprojectname')) end,
      condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
      highlight = {colors.projfg, colors.projbg,}
    }
  },
  {
    BlankSpace = {
      provider = function() return '  ' end,
      highlight = {colors.black, colors.black}
    }
  },
  {
    FileIcon = {
      provider = fileinfo.get_file_icon,
      condition = condition.buffer_not_empty,
      highlight = {
        fileinfo.get_file_icon_color,
        colors.black
      },
    },
  },
  {
    FileName = {
      provider = function()
        return string.format('%s ', fileinfo.get_current_file_name())
      end,
      condition = condition.buffer_not_empty,
      highlight = {colors.bwhite, colors.black, 'italic'}
    }
  },
  {
    BlankSpace = {
      provider = function() return '' end,
      highlight = {colors.bwhite, colors.black}
    }
  },
  {
    DiffAdd = {
      provider = vcs.diff_add,
      icon = '  ',
      condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
      highlight = {colors.bgreen, colors.black}
    }
  },
  {
    DiffModified = {
      provider = vcs.diff_modified,
      icon = '  ',
      condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
      highlight = {colors.bmagenta, colors.black}
    }
  },
  {
    DiffRemove = {
      provider = vcs.diff_remove,
      icon = '  ',
      condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
      highlight = {colors.bred, colors.black}
    }
  },
  {
    Blank = {
      provider = function() return '' end,
      highlight = {colors.black, colors.black}
    }
  }
}

gls.right = {
  {
    DiagnosticError = {
      provider = diagnostic.get_diagnostic_error,
      icon = '  ',
      condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
      highlight = {colors.red, colors.black}
    },
  },
  {
    DiagnosticWarn = {
      provider = diagnostic.get_diagnostic_warn,
      icon = '  ',
      condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
      highlight = {colors.yellow, colors.black}
    },
  },
  {
    DiagnosticHint = {
      provider = diagnostic.get_diagnostic_hint,
      icon = '  ',
      condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
      highlight = {colors.cyan, colors.black}
    }
  },
  {
    DiagnosticInfo = {
      provider = diagnostic.get_diagnostic_info,
      icon = '  ',
      condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
      highlight = {colors.cyan, colors.black}
    }
  },
  {
    LspStatus = {
      provider = function() return string.format(' %s ', lspclient.get_lsp_client()) end,
      icon = '   ',
      condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
      highlight = {colors.white, colors.black}
    }
  },
  {
    FileType = {
      provider = function() return string.format(' %s ', buffer.get_buffer_filetype()) end,
      condition = function() return buffer.get_buffer_filetype() ~= '' end,
      highlight = {colors.white, colors.black}
    }
  },
  {
    FileFormat = {
      provider = function() return string.format('   %s ', fileinfo.get_file_format()) end,
      condition = condition.hide_in_width,
      highlight = {colors.black, colors.white}
    }
  },
  -- {
  --   FileEncode = {
  --     provider = function() return string.format('   %s ', fileinfo.get_file_encode()) end,
  --     condition = condition.hide_in_width,
  --     highlight = {colors.black, colors.bblack}
  --   }
  -- },
  {
    LineInfo = {
      provider = function() return string.format('   %s ', fileinfo.line_column()) end,
      highlight = {colors.dark, colors.magenta}
    }
  },
  {
    LinePercent = {
      provider = function() return string.format(' %s', fileinfo.current_line_percent()) end,
      highlight = {colors.yellow, colors.bgrey}
    }
  },
}

-- gl.short_line_list = {'NvimTree'}
-- gls.short_line_left = {
--   {
--     BufferIcon = {
--       provider = function()
--         local icon = buffer.get_buffer_type_icon()
--         if icon ~= nil then
--           return string.format(' %s ', icon)
--         end
--       end,
--       highlight = {colors.white, colors.black}
--     }
--   },
--   {
--     BufferName = {
--       provider = function()
--         if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
--           local filetype = vim.bo.filetype
--           if filetype == 'NvimTree' then
--             return ' Explorer '
--           end
--         else
--           if fileinfo.get_current_file_name() ~= '' then
--             return string.format(' %s %s| %s ', fileinfo.get_file_icon(), fileinfo.get_file_size() , fileinfo.get_current_file_name())
--           end
--         end
--       end,
--       separator = '',
--       highlight = {colors.white, colors.black}
--     }
--   }
-- }

-- End of File

