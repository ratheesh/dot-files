-- Copyright (c) 2021 Ratheesh <ratheeshreddy@gmail.com>
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

local cmp = require("cmp")
-- local luasnip = require("luasnip")
local lspkind = require('lspkind')

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

cmp.setup({
    snippet = {
     expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
    },
    completion = {
        completeopt = "menu,menuone,noselect",
        keyword_length = 2,
        -- completeopt = "menu,menuone,noinsert",
        get_trigger_characters = function(trigger_characters)
            return vim.tbl_filter(function(char)
                return char ~= ' '
            end, trigger_characters)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
             -- set a name for each source
            vim_item.menu = ({
                spell         = "[Spell]",
                buffer        = "[Buffer]",
                calc          = "[Calc]",
                emoji         = "[Emoji]",
                nvim_lsp      = "[LSP]",
                path          = "[Path]",
                cmp_tabnine   = "[TabNine]",
                look          = "[Look]",
                treesitter    = "[treesitter]",
                ultisnips     = "[UltiSnips]",
                luasnip       = "[LuaSnip]",
                nvim_lua      = "[Lua]",
                latex_symbols = "[Latex]",
                })[entry.source.name]
            return vim_item
        end
    },
    experimental = {
        ghost_text = true,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace, -- try Insert in leue of Replace
                select = true,
        },

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if vim.fn.pumvisible() == 1 then
        --     if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or
        --       vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --       return vim.fn.feedkeys(t(
        --         "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
        --     end

        --     vim.fn.feedkeys(t("<C-n>"), "n")
        --   elseif check_back_space() then
        --     vim.fn.feedkeys(t("<tab>"), "n")
        --   else
        --     fallback()
        --   end
        -- end, {"i", "s"}),

        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if vim.fn.pumvisible() == 1 then
        --     vim.fn.feedkeys(t("<C-p>"), "n")
        --   else
        --     fallback()
        --   end
        -- end, {"i", "s"})

        ["<Tab>"] = cmp.mapping(function(fallback)
          if vim.fn.pumvisible() == 1 then
            feedkey("<C-n>", "n")
          elseif vim.fn["vsnip#available"]() == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          elseif check_back_space() then
            vim.fn.feedkey("<tab>", "n")
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
          if vim.fn.pumvisible() == 1 then
            feedkey("<C-p>", "n")
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
   },
   documentation = {
      border = "rounded",
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 50,
      min_width = 50,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
    sources = {
        {name = 'vsnip'},
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'treesitter'},
        {name = 'nvim_lua'},
        {name = 'latex_symbols'},
        {name = 'calc'},
        {name = 'look'},
        {name = 'buffer',
          opts = {
            -- get_bufnrs = function()
            --   return vim.api.nvim_list_bufs()
            -- end

            get_bufnrs = function()
              local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end
              }
            },

        --{ name = 'spell' },
        --{ name = 'emoji' },
        -- { name = 'luasnip' },
    },
})

-- Autopairs
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
  auto_select = true
})

-- End of File

