-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-live-grep-args.nvim' },
      {'nvim-telescope/telescope-ui-select.nvim' },
      {'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = function()
      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('ui-select')
    end
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use { "catppuccin/nvim", as = "catppuccin" }


  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use("sindrets/diffview.nvim")
  use("nvim-tree/nvim-web-devicons")

  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
      }
    end
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = "<C-_>",
        },
        opleader = {
          line = "<C-_>",
        }
      })
    end
  })

  use({
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  })

  use({'ThePrimeagen/vim-be-good'})

  use({"shortcuts/no-neck-pain.nvim", tag = "*" })

  use({
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  })
  use('mfussenegger/nvim-dap')
  use({ "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} })
  use ({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} })

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use("nvim-treesitter/nvim-treesitter-context");

  use({"folke/flash.nvim"})

  use({'/Users/koulon/Workspace/nvim-grpc-explorer'})

  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })
end)

