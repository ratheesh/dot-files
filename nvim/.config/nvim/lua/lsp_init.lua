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

local lspconfig  = require'lspconfig'
local diagnostic = require'diagnostic'
-- local ncm2       = require('ncm2')
local configs    = require 'lspconfig/configs'
local util       = require 'lspconfig/util'
local compe      = require 'compe'

-- ViM specific settings
vim.o.completeopt = "noinsert,menuone,noselect"
vim.o.pumheight   = 10

-- vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

--- define an chain complete list
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
    { complete_items  = {'path'}, triggered_only   = {'/'}},
    { complete_items = { 'buffer', 'buffers'   } },
  },

  comment = {
    { complete_items = { 'path'    } },
    { complete_items = { 'buffer'  } },
    { complete_items = { 'buffers' } }
  },
}

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- require'lsp_signature'.on_attach()

-- lspkind config
require('lspkind').init({
  with_text  = false,
  symbol_map = {
    Text        = 'ﮜ',
    Method      = '',
    Function    = '',
    Constructor = '',
    Variable    = '',
    Class       = '',
    Interface   = '',
    Module      = '',
    Operator    = '',
    Property    = '',
    Unit        = '',
    Value       = '',
    Enum        = '',
    Keyword     = '',
    Snippet     = '﬌',
    Color       = '',
    File        = '',
    Folder      = '',
    EnumMember  = '',
    Constant    = '',
    Struct      = '',
    Field       = 'ﰠ',
    Type        = '⌂',
  },
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

local servers = {'jedi_language_server','bashls', 'vimls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    -- on_init = ncm2.register_lsp_source,
    init_options = {
    },
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,

  init_options = {
     usePlaceholders = true,
  },
}

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   -- on_init = ncm2.register_lsp_source,
--   cmd = {
--     '/bin/clangd', '--background-index', '--header-insertion=iwyu', '--suggest-missing-includes', '--cross-file-rename'
--   };

--   init_options = {
--     clangdFileStatus = true,
--     usePlaceholders = false,
--     completeUnimported = true,
--     semanticHighlighting = true
--   };

--   completion = {
--     placeholder   = false;
--     detailedLabel = false;
--     spellChecking = true;
--     -- filterAndSort = false;
--   };
-- }

-- placeholder option will only work in recent (after 7-Oct-2019)
lspconfig.ccls.setup {
  on_attach = on_attach,
  -- on_init = ncm2.register_lsp_source,
  init_options = {
    cache = {
      directory    = "/home/ratheesh/.ccls-cache";
      cacheFormat  = "json",
      rootPatterns = {"compile_commands.json", ".prettierrc.json", ".ccls", ".git/", ".svn/", ".hg/"},
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
      placeholder   = true;
      detailedLabel = true;
      spellChecking = true;
      -- filterAndSort = false;
    };
    index = {
      onChange        = true,
      trackDependency = 1
    },
  }
}

-- sumneko lua server

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '$HOME/ppcport/git/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- vim.api.nvim_command('echomsg "NeoViM LSP Client configured!"')

-- End of File

