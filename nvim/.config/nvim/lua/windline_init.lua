-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
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

local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local gps = require("nvim-gps")
-- local vim_components = require('windline.components.vim')

local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
  Black    = { 'white', 'black' },
  White    = { 'black', 'white' },
  Inactive = { 'InactiveFg', 'InactiveBg' },
  Active   = { 'ActiveFg', 'ActiveBg' },

  -- Left Space
  LeftSpace = { 'ActiveFg', 'ActiveBg' },

  -- Mode
  ModeNormal  = {'ModeNormalFg', 'ModeNormalBg', 'bold'},
  ModeInsert  = {'ModeInsertFg', 'ModeInsertBg', 'bold'},
  ModeVisual  = {'ModeVisualFg', 'ModeVisualBg', 'bold'},
  ModeReplace = {'ModeReplaceFg', 'ModeReplaceBg', 'bold'},
  ModeCommand = {'ModeCommandFg', 'ModeCommandBg', 'bold'},

  -- File
  File      = { 'FileNameBg', 'ActiveBg', 'italic' },
  FileIcon  = { 'FileNameFg', 'FileNameBg' },
  SearchCnt = { 'SearchCntFg', 'FileNameBg' },

  Gps       = { 'GpsBg', 'ActiveBg' },

  -- Git status
  GitDiffAdded   = { 'GitAddedFg', 'ActiveBg' },
  GitDiffRemoved = { 'GitRemovedFg', 'ActiveBg' },
  GitDiffChanged = { 'GitChangedFg', 'ActiveBg' },

  -- spell right sep
  PasteRightProjSep = { 'PasteModeBg', 'ProjectNameBg' },
  PasteRightFileSep = { 'PasteModeBg', 'FileNameBg' },
}

local hide_in_width = function() return vim.fn.winwidth(0) > 90 end

local basic = {}

basic.divider = { b_components.divider, '' }
basic.space   = { ' ', '' }
basic.bg      = { ' ', 'StatusLine' }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive  = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive  = { b_components.progress, hl_list.Inactive }

basic.vi_mode = {
  name = 'vi_mode',
  hl_colors = {
    Normal        = hl_list.ModeNormal,
    Insert        = hl_list.ModeInsert,
    Visual        = hl_list.ModeVisual,
    Replace       = hl_list.ModeReplace,
    Command       = hl_list.ModeCommand,
    NormalBefore  = { 'ModeNormalBg', 'black' },
    InsertBefore  = { 'ModeInsertBg', 'black' },
    VisualBefore  = { 'ModeVisualBg', 'black' },
    ReplaceBefore = { 'ModeReplaceBg', 'black' },
    CommandBefore = { 'ModeCommandBg', 'black' },
    NormalAfter   = { 'FileNameBg', 'ModeNormalBg' },
    InsertAfter   = { 'FileNameBg', 'ModeInsertBg' },
    VisualAfter   = { 'FileNameBg', 'ModeVisualBg' },
    ReplaceAfter  = { 'FileNameBg', 'ModeReplaceBg' },
    CommandAfter  = { 'FileNameBg', 'ModeCommandBg' },
  },
  text = function()
    return {
      { sep.left_rounded, state.mode[2] .. 'Before' },
      { state.mode[1] .. ' ', state.mode[2] },
      -- { sep.left_rounded, state.mode[2] .. 'After' },
    }
  end,
}

basic.mode_rightsep = {
  hl_colors = {
    default  = {'FileNameFg', 'FileNameBg'},
    sep_left = {'ProjectNameBg', 'FileNameBg'},
    FileNormalAfter     = { 'FileNameBg', 'ModeNormalBg' },
    FileInsertAfter     = { 'FileNameBg', 'ModeInsertBg' },
    FileVisualAfter     = { 'FileNameBg', 'ModeVisualBg' },
    FileReplaceAfter    = { 'FileNameBg', 'ModeReplaceBg' },
    FileCommandAfter    = { 'FileNameBg', 'ModeCommandBg' },
    PasteNormalAfter    = { 'PasteModeBg', 'ModeNormalBg' },
    PasteInsertAfter    = { 'PasteModeBg', 'ModeInsertBg' },
    PasteVisualAfter    = { 'PasteModeBg', 'ModeVisualBg' },
    PasteReplaceAfter   = { 'PasteModeBg', 'ModeReplaceBg' },
    PasteCommandAfter   = { 'PasteModeBg', 'ModeCommandBg' },
    ProjectNormalAfter  = { 'ProjectNameBg', 'ModeNormalBg' },
    ProjectInsertAfter  = { 'ProjectNameBg', 'ModeInsertBg' },
    ProjectVisualAfter  = { 'ProjectNameBg', 'ModeVisualBg' },
    ProjectReplaceAfter = { 'ProjectNameBg', 'ModeReplaceBg' },
    ProjectCommandAfter = { 'ProjectNameBg', 'ModeCommandBg' },
  },
  text = function(bufnr)
  if vim.o.paste then
    return {
      { sep.left_rounded, 'Paste' .. state.mode[2] .. 'After' }
    }
  end
  if git_comps.is_git(bufnr) then
    return {
      { sep.left_rounded, 'Project' .. state.mode[2] .. 'After' },
    }
  else
    return {
      { sep.left_rounded, 'File' .. state.mode[2] .. 'After' },
    }
  end
end,
}

basic.paste_mode = {
  hl_colors = {
    default             = { 'FileNameFg', 'FileNameBg'},
    sep_right_proj      = hl_list.PasteRightProjSep,
    sep_right_file      = hl_list.PasteRightFileSep,
    paste_mode          = { 'PasteModeFg', 'PasteModeBg'},
    FileNormalAfter     = { 'FileNameBg', 'ModeNormalBg' },
    FileInsertAfter     = { 'FileNameBg', 'ModeInsertBg' },
  },
  text = function(bufnr)
    if vim.o.paste then
      if git_comps.is_git(bufnr) then
        return {
          { 'ραstɛ', 'paste_mode', },
          { sep.right_rounded..' ', 'sep_right_proj' },
        }
      else
        return {
          { 'ραstɛ', 'paste_mode', },
          { sep.right_rounded..' ', 'sep_right_file' },
        }
      end
    end
  end,
}

basic.projectname = {
  name = 'projectname',
  hl_colors = {
    sep_right = {'ProjectNameFg', 'FileNameBg'},
    project   = {'ProjectNameFg', 'ProjectNameBg', 'bold'}

  },
  text = function(bufnr)
    if git_comps.is_git(bufnr) then
      return {
        { git_comps.git_branch({icon = ' '}), 'project' },
      }
    end
  end,
}

basic.file_leftsep = {
  hl_colors = {
    default  = {'FileNameFg', 'FileNameBg'},
    sep_left = {'ProjectNameBg', 'FileNameBg'},
  },
  text = function(bufnr)
  if git_comps.is_git(bufnr) then
    return {
      { sep.right_rounded, 'sep_left' },
      { '', 'default' },
    }
    else
      return ''
  end
end,
}

local function is_file_ro()
  if vim.bo.readonly then
    return ''
  end
  return ''
end

basic.file = {
  name = 'file',
  hl_colors = {
    default      = hl_list.File,
    FileName     = { 'FileFg', 'FileBg', 'italic' },
    FileModified = { 'FileNameModFg', 'FileNameBg' },
    FileRO       = { 'FileNameROFg', 'FileNameBg' },
    FileIcon     = hl_list.FileIcon
  },
  text = function()
    return {
      { ' ', 'FileName' },
      {b_components.cache_file_icon({ default = '' }), 'FileIcon'},
      { ' ', '' },
      { b_components.cache_file_name('[No Name]', 'unique'), 'FileName' },
      -- { b_components.file_icon(''), 'FileIcon' },
      -- { b_components.file_name(''), 'FileName' },
      { b_components.file_modified('✱ '), 'FileModified' },
      { is_file_ro(), 'FileRO' },
    }
  end,
}

local function gps_info()
  if gps.is_available() then
    local data = gps.get_location()
    if data == '' then
      return ''
    else
      return ' ' .. data
    end
  end
  return ''
end

basic.file_rightsep = {
  hl_colors = {
    default  = {'FileNameBg', 'ActiveBg'},
    sep_right_file = {'FileNameBg', 'GpsBg'},
  },
  text = function()
    if gps_info() ~= "" then
      return {
        { sep.right_rounded, 'sep_right_file' },
        { '', 'default' },
      }
    else
      return {
        { sep.right_rounded, 'default' },
        { '', 'default' },
      }
    end
  end,
}

basic.git = {
  name = 'git',
  hl_colors = {
    added   = hl_list.GitDiffAdded,
    changed = hl_list.GitDiffChanged,
    removed = hl_list.GitDiffRemoved
  },
  text = function(bufnr)
    if git_comps.is_git(bufnr) and hide_in_width() then
      return {
        { ' ', ' ' },
        { git_comps.diff_added({ format = ' %s', show_zero = false }), 'added' },
        { git_comps.diff_changed({ format = ' 柳%s', show_zero = false }), 'changed' },
        { git_comps.diff_removed({ format = '  %s', show_zero = false }), 'removed' },
      }
    end
    return ''
  end,
}

basic.gps = {
  name = 'gps',
  width = 20,
  hl_colors = {
    GpsHL           = {'GpsFg', 'GpsBg'},
    GpsRightSep     = {'GpsBg', 'ActiveBg'},
    },
  text = function()
    if gps.is_available() then
      return {
        {  gps_info(), 'GpsHL' },
        -- {  sep.right_rounded, 'GpsRightSep' },
      }
    else
      return {
        { '', '' }
      }
    end
  end,
}

basic.gps_right_sep = {
  name = 'gps',
  width = 20,
  hl_colors = {
    GpsHL           = {'GpsFg', 'GpsBg'},
    GpsRightSep     = {'GpsBg', 'ActiveBg'},
    },
  text = function()
    if gps_info() ~= "" then
      return {
        {  sep.right_rounded, 'GpsRightSep' },
      }
    else
      return {
        { '', '' }
      }
    end
  end,
}

-- Right side segment

---------------------------------------------
-- local check_lsp_status = lsp_comps.check_lsp({})
basic.lsp_diagnos = {
  name = 'diagnostic',
  hl_colors = {
    red    = { 'red', 'ActiveBg' },
    yellow = { 'yellow', 'ActiveBg' },
    blue   = { 'blue', 'ActiveBg' },
  },
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { lsp_comps.lsp_hint({ format = '  %s', show_zero = false }), 'blue' },
        { lsp_comps.lsp_warning({ format = '  %s', show_zero = false}), 'yellow' },
        { lsp_comps.lsp_error({ format = '  %s', show_zero = false }), 'red' },
      }
    end
    return ''
  end,
}

local function lsp_client_names(component)
    local clients = {}
    local icon = component.icon or ' '

    for _, client in pairs(vim.lsp.get_active_clients()) do
        table.insert(clients, client.name)
    end

    return icon .. '(' .. table.concat(clients, ',') .. ')'
end

-- local lsp_server_name = lsp_comps.lsp_name()
basic.lsp_client = {
  hl_colors = {
    sep_before       = { 'LSPClientBg', 'NormalBg' },
    sep_before_empty = { 'FileInfoBg', 'NormalBg' },
    lsp_cl           = { 'LSPClientFg', 'LSPClientBg', 'italic' },
    sep_after        = { 'FileInfoBg', 'LSPClientBg' },
  },
  text = function()
    if lsp_comps.check_lsp() then
      return {
        { sep.left_rounded, 'sep_before' },
        { lsp_client_names({}), 'lsp_cl' },
        { ' ', ''},
        { sep.left_rounded, 'sep_after' },
      }
    else
      return {
        { sep.left_rounded, 'sep_before_empty'}
      }
    end
  end,
}

basic.fileinfo = {
  name = 'fileinfo',
  hl_colors = {
    sep_before = { 'FileInfoBg', 'ActiveBg' },
    sep        = { 'black', 'FileInfoBg' },
    file_type  = { 'FileInfoFg', 'FileInfoBg' },
    FileIcon     = hl_list.FileIcon
  },
  text = function()
      return {
        -- { sep.left_rounded, 'sep_before' },
        { b_components.file_icon({ icon = '' }), 'file_type' },
        { ' ', 'file_type' },
        { b_components.file_type(), 'file_type' },
        {'│','sep'},
        { b_components.file_format({icon = true}), 'file_type' },
        { ' ', '' },
      }
  end,
}

basic.indent = {
  hl_colors = {
    sep_before = { 'IndentBg', 'FileInfoBg' },
    color      = { 'IndentFg', 'IndentBg' },
  },
  text = function()
    local sw = vim.bo.shiftwidth
    local et = vim.bo.expandtab
    local im = ''
    if et == true then
      im='•'
    else
      im='▸'
    end
    return {
      { sep.left_rounded, 'sep_before' },
      {string.format('%s%s≡ ', sw, im), 'color'}
    }
  end,
}

basic.right = {
  hl_colors = {
    sep_before = { 'RightBg', 'IndentBg' },
    sep_after  = { 'RightBg', 'black' },
    text       = { 'black', 'RightBg' },
    lineno     = { 'LineNoFg', 'LineNoBg' },
    sep        = { 'black', 'RightBg', 'bold' },
  },
  text = function()
    return {
      { sep.left_rounded, 'sep_before' },
      { 'ch:%02BH', 'text' },
      {'│','sep'},
      { '', 'text' },
      {' %l:%v','text'},
      {'│','sep'},
      {'%p%%','text'},
      { sep.right_rounded, 'sep_after' },
    }
  end,
}

local default = {
  filetypes = { 'default' },
  active = {
    { ' ', hl_list.Black },
    basic.vi_mode,
    basic.mode_rightsep,
    basic.paste_mode,
    basic.projectname,
    basic.file_leftsep,
    basic.file,
    basic.file_rightsep,
    basic.gps,
    basic.gps_right_sep,
    -- { sep.right_rounded, hl_list.File },
    basic.git,
    basic.divider,
    -- basic.lsp_progress,
    basic.lsp_diagnos,
    { ' ', hl_list.Active },
    basic.lsp_client,
    basic.fileinfo,
    basic.indent,
    basic.right,
    { ' ', hl_list.Black },
  },

  inactive = {
    basic.file_name_inactive,
    basic.divider,
    basic.divider,
    basic.line_col_inactive,
    { '', { 'white', 'InactiveBg' } },
    basic.progress_inactive,
  },
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },
    always_active = true,
    show_last_status = true
}

windline.setup({
  colors_name = function(colors)
    -- Common colors
    -- colors.black_light   = "#595B83"
    -- colors.green_light   = "#99c794"
    colors.NormalFg      = "#c5cdd9"
    colors.NormalBg      = "#383a4c"
    colors.ActiveFg      = "#c5cdd9"
    colors.ActiveBg      = "#383a4c"
    colors.InActiveFg    = "#c5cdd9"
    colors.InActiveBg    = "#383a4c"

    -- Mode
    colors.ModeNormalFg  = "#000000"
    colors.ModeInsertFg  = "#000000"
    colors.ModeVisualFg  = "#000000"
    colors.ModeReplaceFg = "#000000"
    colors.ModeCommandFg = "#000000"

    colors.ModeNormalBg  = "#d0a2c7"
    colors.ModeInsertBg  = "#8dd3c7"
    colors.ModeVisualBg  = "#F7CAB8"
    colors.ModeReplaceBg = "#D85A93"
    colors.ModeCommandBg = "#AE8A7E"

    -- termguicolors
    colors.FileFg        = "#F4C493"
    colors.FileBg        = "#505C74"
    colors.FileNameFg    = "#FEFEFE"
    colors.FileNameBg    = "#505C74"
    colors.FileNameModFg = "#00AFDB"
    colors.FileNameROFg  = "#EC5F67"

    colors.PasteModeFg   = "#eeeeee"
    colors.PasteModeBg   = "#AC547E"

    colors.GitAddedFg    = "#4eb899"
    colors.GitChangedFg  = "#B99AB9"
    colors.GitRemovedFg  = "#EA4050"

    colors.LSPDiagErrFg  = "#FD5866"
    colors.LSPDiagWarnFg = "#729FCF"
    colors.LSPDiagHintFg = "#9987A4"

    colors.GpsFg         = "#FEFEFE"
    colors.GpsBg         = "#984ea3"

    colors.LSPClientFg   = "#eeeeee"
    colors.LSPClientBg   = "#356088"

    colors.ProjectNameFg = "#EEEEEE"
    colors.ProjectNameBg = "#2087CF"

    colors.FileInfoFg    = "#000000"
    colors.FileInfoBg    = "#D3869B"

    colors.IndentFg      = "#eeeeee"
    colors.IndentBg      = "#605FAB"
    colors.SearchCntFg   = "#4EB899"

    colors.LineNoFg      = "#eeeeee"
    colors.LineNoBg      = "#A070C8"
    colors.RightBg       = "#B3C1A9"

    return colors
  end,

  statuslines = {
    default,
    quickfix,
  },
})

-- local windline = require('windline')
-- local winbar = {
--   filetypes = { 'winbar' },
--   active = {
--     { ' ' },
--     { '%=' },
--     {
--       function(bufnr)
--         local bufname = vim.api.nvim_buf_get_name(bufnr)
--         local path = vim.fn.fnamemodify(bufname, ':~:.')
--         return path
--       end,
--       { 'red', 'white' },
--     },
--   },
--   inactive = {
--     { ' ', { 'white', 'InactiveBg' } },
--     { '%=' },
--     {
--       function(bufnr)
--         local bufname = vim.api.nvim_buf_get_name(bufnr)
--         local path = vim.fn.fnamemodify(bufname, ':~:.')
--         return path
--       end,
--       { 'white', 'InactiveBg' },
--     },
--   },
-- }

-- windline.add_status(winbar)

-- End of File
