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
-- Python pyright -> $ npm i -g pyright
--
-- C/C++ -> Using CCLS
-- $ sudo apt get install ccls libtinfo5
--
-- bashls
-- $ npm install -g bashls

local lspconfig  = require'lspconfig'
-- local diagnostic = require'diagnostic'

-- ViM specific settings
vim.o.completeopt = "noinsert,menuone,noselect"
vim.o.pumheight   = 12

-- vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

-- Add additional capabilities supported by nvim-cmp

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat     = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport          = true
capabilities.textDocument.completion.completionItem.preselectSupport        = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport    = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport     = true
capabilities.textDocument.completion.completionItem.deprecatedSupport       = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport              = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport          = {
properties = {
'documentation',
'detail',
'additionalTextEdits',
},
}

-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline    = true,
--     signs        = true,
--     virtual_text = false,
--     float = {
--         show_header = true,
--         source      = 'if_many',
--         border      = 'rounded',
--         focusable   = false,
--     },
--     show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
--     update_in_insert = false,
--     severity_sort    = false,
-- }
-- )

vim.diagnostic.config({
    underline    = true,
    signs        = true,
    virtual_text = true,
    float = {
        show_header = true,
        source      = 'always',
        border      = 'rounded',
        focusable   = false,
    },
    show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
    update_in_insert = false,
    severity_sort    = false,
})

local on_attach = function(_, bufnr)

  -- don't enable omnifunc for nvim-compe plugin
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- lsp_status.register_progress()

  -- require "lsp_signature".on_attach({
  --   bind            = true,
  --   doc_lines       = 0,
  --   floating_window = true,
  --   hint_enable     = true,
  --   hi_parameter    = "LSPSignatureCurParam",
  --   hint_scheme     = "LSPSignatureHint",
  --   hint_prefix     = "🐼 ",
  --   handler_opts    = {
  --     border = "single"
  --   }
  -- })

  -- Mappings
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true  }

  buf_set_keymap('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n','gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n','<leader>ee','<cmd>lua vim.diagnostic.open_float(0, { scope="line" })<CR>', opts)
  buf_set_keymap('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)

  -- vim.cmd [[ nnoremap gR :lua require'lspactions'.rename()<CR> ]]

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})
  -- vim.lsp.handlers["textDocument/declaration"] = vim.lsp.with(vim.lsp.handlers.declaration, {border = "single"})
  -- vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(vim.lsp.handlers.definition, {border = "single"})

  vim.lsp.handlers["textDocument/codeAction"] = require'lspactions'.codeaction
  vim.cmd [[ nnoremap <leader>ca :lua require'lspactions'.code_action()<CR> ]]

  vim.lsp.handlers["textDocument/references"] = require'lspactions'.references
  vim.cmd [[ nnoremap gr :lua vim.lsp.buf.references()<CR> ]]

  vim.lsp.handlers["textDocument/definition"] = require'lspactions'.definition
  vim.cmd [[ nnoremap gd :lua vim.lsp.buf.definition()<CR> ]]

  vim.lsp.handlers["textDocument/declaration"] = require'lspactions'.declaration
  vim.cmd [[ nnoremap gD :lua vim.lsp.buf.declaration()<CR> ]]

  vim.lsp.handlers["textDocument/implementation"] = require'lspactions'.implementation
  vim.cmd [[ nnoremap gi :lua vim.lsp.buf.implementation()<CR> ]]

  vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single",
  })

  -- enable border for signature
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single",
  })

end

-- jedi_language_server
local servers = {'jedi_language_server', 'bashls', 'vimls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
    },

  flags = {
    debounce_text_changes = 150,
  };

  }
end

lspconfig.gopls.setup {
  cmd = {'gopls'},
  capabilities = capabilities,
  settings = {
    gopls =     {
      experimentalPostfixCompletions = true,
      analyses = {
      unusedparams = true,
      shadow       = true,
    },
    staticcheck = true,
    },
  },
on_attach = on_attach,
}

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {
--     '/bin/clangd', '--background-index', '--header-insertion=iwyu', '--suggest-missing-includes', '--cross-file-rename', '--completion-style=detailed', '--pch-storage=memory', '--header-insertion-decorators', '--all-scopes-completion'
--   };

--   filetypes = { "c", "cpp", "objc", "objcpp" };

--   flags = {
--     debounce_text_changes = 150,
--   };

--   init_options = {
--     clangdFileStatus     = true,
--     usePlaceholders      = false,
--     completeUnimported   = true,
--     semanticHighlighting = true
--   };

--   completion = {
--     detailedLabel = false;
--     placeholder   = false;
--     detail = false;
--     -- spellChecking = true;
--     -- filterAndSort = false;
--   };
-- }

-- placeholder option will only work in recent (after 7-Oct-2019)
lspconfig.ccls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'ccls' };
  init_options = {
    cache = {
      directory    = vim.env.HOME.."/.ccls-cache";
      cacheFormat  = "json",
      rootPatterns = {"compile_commands.json", ".prettierrc.json", ".ccls", ".git/", ".svn/", ".hg/"},
      clang = {
        -- extraArgs   = {"-fms-extensions", "-fms-compatibility", "-f1elayed-template-parsing"},
        extraArgs   = {'--header-insertion=iwyu', '--suggest-missing-includes', '--cross-file-rename', '--completion-style=detailed', '--pch-storage=memory', '--header-insertion-decorators', '--all-scopes-completion'},
        -- excludeArgs = {},
      },
    },

    flags = {
      debounce_text_changes = 150,
    };

    codeLens = {
      localVariables = true;
    },

    client = {
      snippetSupport = true;
    };

    completion = {
      placeholder   = true;
      detailedLabel = false;
      spellChecking = true;
      -- filterAndSort = false;
    };
    index = {
      onChange        = false,
      trackDependency = 1
    },
  }
}

-- sumneko lua server
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = vim.env.HOME..'/ppcport/git/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
require('lspconfig').sumneko_lua.setup({
  capabilities = capabilities,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  -- An example of settings for an LSP server.
  --    For more options, see nvim-lspconfig
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
    }
  },
  -- on_attach = on_attach
})

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

-- End of File

