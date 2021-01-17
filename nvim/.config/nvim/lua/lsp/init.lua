-- Copyright (C) 2020  Ratheesh <ratheeshreddy@gmail.com>
-- Author: Ratheesh S
--
-- Configuration of NeoViM built-in LSP client
-- Works only on NeoVim v.0.5.0 and newer versions
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

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

-- placeholder option will only work in recent (after 7-Oct-2019)
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    },
    codeLens = {
      localVariables = true;
    },
    client = {
      snippetSupport = true;
    };
    completion = {
      placeholder   = false;
      detailedLabel = true;
      spellChecking = true;
      -- filterAndSort = false;
    };
  }
}

vim.api.nvim_command('echomsg "NeoViM LSP Client configured!"')

-- End of File

