-- Copyright 2021 Ratheesh <ratheeshreddy@gmail.com>
-- Author: Ratheesh S
--
-- Configuration of NeoViM built-in LSP client
-- Works only on NeoVim v.0.5.0 and newer versions
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

-- Notes
-- Python LSP -> use jedi_language_server
-- $ pip3 install -U -user jedi_language_server
--
-- C/C++ -> Using CCLS
-- $ sudo apt get install ccls libtinfo5
--
-- bashls
-- $ npm install -g bashls

local lspconfig = require'lspconfig'
local diagnostic = require'diagnostic'
local completion = require'completion'

vim.lsp.callbacks["textDocument/publishDiagnostics"] = nil

-- define an chain complete list
local chain_complete_list = {
  default = {
    {complete_items = {'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'lsp'}},
    {complete_items = {'buffer'}},
    {complete_items = {'buffers'}},
    {complete_items = {'tmux'}},
  },

  string = {
    {complete_items  = {'path'}, triggered_only   = {'/'}},
    { complete_items = { 'buffer', 'buffers'  }},
  },

  comment = {
    { complete_items = { 'path'  }},
    { complete_items = { 'buffer'}},
    { complete_items = {'buffers'}}
  },
}

-- autocmd BufEnter * lua require'completion'.on_attach()

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- passing in a table with on_attach function
  require'completion'.on_attach({
    enable_snippet         = 'vsnippet',
    enable_auto_popup      = 1,
    enable_auto_signature  = 1,
    auto_change_source     = 1,
    enable_auto_hover      = 1,
    enable_auto_signature  = 1,
    enable_auto_paren      = 1,
    matching_smart_case    = 1,
    trigger_on_delete      = 1,
    auto_change_source     = 1,
    trigger_keyword_length = 1,
    timer_cycle            = 200,
    confirm_key            = "<C-y>",
    sorting                = 'alphabet',
    matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'},
    chain_complete_list    = chain_complete_list,
  })

  -- Mappings
  local opts = { noremap=true, silent=true  }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local servers = {'ccls','gopls','jedi_language_server','bashls', 'vimls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

-- placeholder option will only work in recent (after 7-Oct-2019)
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory    = "/home/ratheesh/.ccls-cache";
      cacheFormat  = "json",
      rootPatterns = {"compile_comman1s.json", ".prettierrc.json", ".ccls", ".git/", ".svn/", ".hg/"},
      clang = {
        extraArgs   = {"-fms-extensions", "-fms-compatibility", "-f1elayed-template-parsing"},
        excludeArgs = {},
      },
    },
    codeLens = {
      localVariables = true;
    },
    client = {
      snippetSupport = true;
    };
    completion = {
      placeholder   = false;
      detailedLabel = false;
      spellChecking = true;
      -- filterAndSort = false;
    };
    index = {
      onChange        = true,
      trackDependency = 1
    },
  }
}

vim.api.nvim_command('echomsg "NeoViM LSP Client configured!"')

-- End of File

