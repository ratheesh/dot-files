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
local compe = require'compe'

-- ViM specific settings
vim.o.completeopt = "noinsert,menuone,noselect"
vim.o.pumheight = 10

vim.lsp.callbacks["textDocument/publishDiagnostics"] = nil

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

lspconfig.clangd.setup {
  on_attach = on_attach,
  cmd = {
    '/bin/clangd', '--background-index', '--header-insertion=iwyu', '--suggest-missing-includes', '--cross-file-rename'
  },

  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true
  }
}

-- placeholder option will only work in recent (after 7-Oct-2019)
lspconfig.ccls.setup {
  on_attach = on_attach,
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

