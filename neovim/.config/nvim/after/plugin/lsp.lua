local lsp_zero = require('lsp-zero')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


require('lspconfig').ts_ls.setup({})
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})
require('lspconfig').angularls.setup({})


-- require('lspconfig').eslint.setup({
--  on_attach = function(client, bufnr)
--    vim.api.nvim_create_autocmd("BufWritePre", {
--      buffer = bufnr,
--      command = "EslintFixAll",
--    })
--  end,
-- })
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'ts_ls', 'lua_ls', 'angularls'},
  handlers = {
    lsp_zero.default_setup,
  }
})

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping=cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true}),
    ['<Tab>'] = cmp.mapping.confirm({ select = true}),
    ['<C-space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action()  end, opts)

