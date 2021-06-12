local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
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
  ModeNormal  = {'black', 'ModeNormalBg', 'bold'},
  ModeInsert  = {'black', 'ModeInsertBg', 'bold'},
  ModeVisual  = {'black', 'ModeVisualBg', 'bold'},
  ModeReplace = {'white', 'ModeReplaceBg', 'bold'},
  ModeCommand = {'black', 'ModeCommandBg', 'bold'},

  -- File
  File      = { 'FileNameBg', 'ActiveBg' },
  FileIcon  = { 'FileNameFg', 'FileNameBg' },
  SearchCnt = { 'SearchCntFg', 'FileNameBg' },

  -- Git status
  GitDiffAdded   = { 'GitAddedFg', 'ActiveBg' },
  GitDiffRemoved = { 'GitRemovedFg', 'ActiveBg' },
  GitDiffChanged = { 'GitChangedFg', 'ActiveBg' },
}

local hide_in_width = function() return vim.fn.winwidth(0) > 90 end

local basic = {}

basic.divider = { b_components.divider, '' }
basic.space   = { ' ', '' }
basic.bg      = { ' ', 'StatusLine' }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive  = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive  = { b_components.progress, hl_list.Inactive }

local function is_project_valid()
  local project = vim.call('utils#getprojectname')
  if project == '' then
    return false
  else
    return true
  end
end

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
    ProjectNormalAfter  = { 'ProjectNameBg', 'ModeNormalBg' },
    ProjectInsertAfter  = { 'ProjectNameBg', 'ModeInsertBg' },
    ProjectVisualAfter  = { 'ProjectNameBg', 'ModeVisualBg' },
    ProjectReplaceAfter = { 'ProjectNameBg', 'ModeReplaceBg' },
    ProjectCommandAfter = { 'ProjectNameBg', 'ModeCommandBg' },
  },
  text = function()
  if git_comps.is_git() then
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

local function project_name()
  local icon = ''
  if git_comps.is_git() then
    icon = ' '
    return  icon .. vim.call('utils#getprojectname')
  end
  return ''
end

basic.projectname = {
  name = 'projectname',
  hl_colors = {
    sep_right = {'ProjectNameFg', 'FileNameBg'},
    project   = {'ProjectNameFg', 'ProjectNameBg', 'italic'}

  },
  text = function()
    if is_project_valid() then
      return {
        -- { ' ', 'project' },
        -- { vim.call('utils#getprojectname'), 'project' },
        { project_name(), 'project' },
      }
    end
  end,
}

basic.file_leftsep = {
  hl_colors = {
    default  = {'FileNameFg', 'FileNameBg'},
    sep_left = {'ProjectNameBg', 'FileNameBg'},
  },
  text = function()
  if git_comps.is_git() then
    return {
      { sep.right_rounded, 'sep_left' },
      { ' ', 'default' },
    }
    else
      -- return { { ' ', 'default' } }
      return ''
  end
end,
}

basic.file = {
  name = 'file',
  hl_colors = {
    default      = hl_list.File,
    FileName     = {'FileNameFg', 'FileNameBg'},
    FileModified = {'FileNameModFg', 'FileNameBg'},
    FileIcon     = hl_list.FileIcon
  },
  text = function()
    return {
      { b_components.file_icon(''), 'FileIcon' },
      { ' ', 'FileName' },
      { b_components.file_name(''), 'FileName' },
      { b_components.file_modified('✱ '), 'FileModified' },
    }
  end,
}

basic.git = {
  name = 'git',
  hl_colors = {
    added   = hl_list.GitDiffAdded,
    changed = hl_list.GitDiffChanged,
    removed = hl_list.GitDiffRemoved
  },
  text = function()
    if git_comps.is_git() and hide_in_width() then
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

-- Right side segment

local check_lsp_status = lsp_comps.check_lsp({})
basic.lsp_diagnos = {
  name = 'diagnostic',
  hl_colors = {
    red    = { 'red', 'ActiveBg' },
    yellow = { 'yellow', 'ActiveBg' },
    blue   = { 'blue', 'ActiveBg' },
  },
  text = function()
    if check_lsp_status() then
      return {
        { lsp_comps.lsp_error({ format = '  %s', show_zero = false }), 'red' },
        { lsp_comps.lsp_warning({ format = '  %s', show_zero = false}), 'yellow' },
        { lsp_comps.lsp_hint({ format = '  %s', show_zero = false }), 'blue' },
      }
    end
    return ''
  end,
}

-- local lsp_server_name = lsp_comps.lsp_name()
basic.lspclient = {
  hl_colors = {
    sep_before = { 'IndentBg', 'ActiveBg' },
    lsp_cl     = { 'LSPClientFg', 'LSPClientBg' },
  },
  text = function()
    if check_lsp_status() then
      return {
        { sep.left_rounded, 'sep_before' },
        { lsp_comps.lsp_name('L'), 'lsp_cl' },
      }
    end
  end,
}

basic.fileinfo = {
  name = 'fileinfo',
  hl_colors = {
    sep_before = { 'FileInfoBg', 'ActiveBg' },
    file_type  = { 'FileInfoFg', 'FileInfoBg' },
  },
  text = function()
      return {
        { sep.left_rounded, 'sep_before' },
        { b_components.file_icon(), 'file_type' },
        { ' ', '' },
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
    color      = { 'black', 'IndentBg' },
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
    text       = { 'white', 'RightBg' },
    lineno     = { 'LineNoFg', 'LineNoBg' },
    sep        = { 'black', 'RightBg', 'bold' },
  },
  text = function()
    return {
      { sep.left_rounded, 'sep_before' },
      { 'ch:%02Bh', 'text' },
      {'│','sep'},
      { '', 'text' },
      {' %l:%v','text'},
      {'│','sep'},
      {'%2p%%','text'},
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
    basic.projectname,
    basic.file_leftsep,
    basic.file,
    -- {vim_components.search_count(), hl_list.SearchCnt},
    { sep.right_rounded, hl_list.File },
    basic.git,
    basic.divider,
    basic.lsp_diagnos,
    { ' ', hl_list.Active },
    -- basic.lspclient,
    basic.fileinfo,
    basic.indent,
    basic.right,
    { ' ', hl_list.Black },
  },

  in_active = {
    basic.file_name_inactive,
    basic.divider,
    basic.divider,
    basic.line_col_inactive,
    { '', { 'white', 'InactiveBg' } },
    basic.progress_inactive,
  },
}

windline.setup({
  colors_name = function(colors)
    -- Common colors
    colors.black_light   = "#595B83"
    colors.green_light   = "#99c794"
    colors.NormalFg      = "#c5cdd9"
    colors.NormalBg      = "#383a4c"
    colors.ActiveFg      = "#c5cdd9"
    colors.ActiveBg      = "#383a4c"
    colors.InActiveFg    = "#c5cdd9"
    colors.InActiveBg    = "#383a4c"

    -- Mode
    colors.ModeNormalBg  = "#c5cdd9"
    colors.ModeInsertBg  = "#00A59E"
    colors.ModeVisualBg  = "#F7CAB8"
    colors.ModeReplaceBg = "#D85A93"
    colors.ModeCommandBg = "#AE8A7E"

    -- termguicolors
    colors.FileNameFg    = "#fefefe"
    colors.FileNameBg    = "#595B83"
    colors.FileNameModFg = "#00AFDB"

    colors.GitAddedFg    = "#99c794"
    colors.GitChangedFg  = "#B99AB9"
    colors.GitRemovedFg  = "#ec5f67"

    colors.LSPDiagErrFg  = "#FF3140"
    colors.LSPDiagWarnFg = "#d3869b"
    colors.LSPDiagHintFg = "#99c794"

    colors.LSPClientFg   = "#000000"
    colors.LSPClientBg   = "#d3869b"

    colors.ProjectNameFg = "#eeeeee"
    colors.ProjectNameBg = "#ac547e"

    colors.FileInfoFg    = "#000000"
    colors.FileInfoBg    = "#d3869b"

    colors.IndentBg      = "#B3C1A9"
    colors.SearchCntFg   = "#4eb899"

    colors.LineNoFg      = "#eeeeee"
    colors.LineNoBg      = "#335078"
    colors.RightBg       = "#025660"

    return colors
  end,

  statuslines = {
    default,
  },
})
-- End of File
