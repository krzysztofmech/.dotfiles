local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync 
  augroup end
]])
local status, packer = pcall(require, "packer")

if not status then
  return
end

return packer.startup(function(use)
  -- loads plugins 
  use 'wbthomason/packer.nvim'

  -- lua functions that some plugins use 
  use 'nvim-lua/plenary.nvim'

  -- themes
  use 'haishanh/night-owl.vim'
  use 'folke/tokyonight.nvim'

  -- list for showing diagnostics, references, telescope results, quickfix 
  -- and location lists to help you solve all the trouble your code is causing. 
  use {
    "folke/trouble.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons"
    }
  }
  -- git plugin 
  use "tpope/vim-fugitive"

  -- bottom editor line
  use 'nvim-lualine/lualine.nvim'
  -- some icon
  use 'nvim-tree/nvim-web-devicons'

  -- tmux navigator 
  use 'christoomey/vim-tmux-navigator'

  -- editor file tree 
  use 'nvim-tree/nvim-tree.lua'

  -- comments mappings
  use 'numToStr/Comment.nvim'

  -- project files search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- change surrounding chars ex: cs"' in "Hello World" to 'Hello World'
  use 'tpope/vim-surround'

  -- ????????
  use 'inkarkat/vim-ReplaceWithRegister'
  -- language servers, autocompletion, snippets
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},
      -- snippets 
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  -- adds ui/commands that take advantage of the capabilities 
  -- of the neovim lsp client like showing information in statusline 
  -- and nice looking commands for goto definition and stuff
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }

  -- ??????????????
  use 'onsails/lspkind.nvim'
  use { 'windwp/nvim-ts-autotag', after = "nvim-treesitter" }
  use 'ThePrimeagen/vim-be-good'
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use 'lewis6991/gitsigns.nvim'
  use ({
    'stevearc/conform.nvim',
    config = function ()
      require("conform").setup()
    end
  })
  if packer_bootstrap then
    require("packer").sync()
  end
end)
