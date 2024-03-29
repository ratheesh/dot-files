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

-- nvim-compe settings

vim.cmd [[set shortmess+=c]]

require'compe'.setup {
  enabled              = true;
  autocomplete         = true;
  debug                = false;
  omni                 = false;
  min_length           = 1;
  preselect            = 'enable';
  allow_prefix_unmatch = false;
  throttle_time        = 80;
  source_timeout       = 200;
  incomplete_delay     = 400;
  max_abbr_width       = 80;
  max_kind_width       = 80;
  max_menu_width       = 80;
  -- documentation        = true;

  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };


  source = {
    ultisnips     = {priority = 50};
    path          = {priority = 49};
    nvim_lsp      = {priority = 48};
    tags          = {priority = 47};
    buffer        = {priority = 46};
    spell         = {priority = 45};
    calc          = {priority = 44};
    nvim_lua      = {priority = 43};
    treesitter    = false;
    vsnip         = false;
    tmux          = true;
    snippets_nvim = false;
    orgmode       =  true;
  };
}

-- set navigation control using <Tab> and <S-Tab>
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- End of File
