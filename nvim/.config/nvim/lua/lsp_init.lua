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

-- local util = require("lspconfig/util")
-- local path = util.path

-- ViM specific settings
vim.o.completeopt = "noinsert,menuone,noselect"
vim.o.pumheight   = 12

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

vim.diagnostic.config({
  float = {
    source = 'always',
    border = "rounded"
  },
})

-- vim.diagnostic.config({
--   underline    = true,
--   signs        = true,
--   virtual_text = true,
--   float = {
--     show_header = true,
--     source      = 'always',
--     border      = 'rounded',
--     focusable   = false,
--   },
--   show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
--   update_in_insert = false,
--   severity_sort    = false,
-- })

local on_attach = function(_, bufnr)
  -- Mappings
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local opts = { noremap=true, silent=true  }
  --
  -- buf_set_keymap('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n','gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- -- buf_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  -- buf_set_keymap('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- buf_set_keymap('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n','<leader>ca','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n','<leader>ee','<cmd>lua vim.diagnostic.open_float(0, { scope="line" })<CR>', opts)
  -- buf_set_keymap('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- buf_set_keymap('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  -- buf_set_keymap('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)

  local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }
  bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  bufmap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  bufmap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  bufmap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  bufmap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  bufmap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap("n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename.float()<CR>", opts)
  bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  bufmap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", opts)
  bufmap("n", "gx", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  bufmap("n", "gz", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  bufmap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- require("illuminate").on_attach(client)
end

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

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.diagnostic.config( { virtual_text = false, float = { show_header = false, border = "rounded" } })

-- End of File

