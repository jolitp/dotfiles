-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
	    'git', 
	    'clone', 
	    '--depth', 
	    '1', 
	    'https://github.com/wbthomason/packer.nvim', 
	    install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify "error while loading packer"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local packer_bootstrap = ensure_packer()


packer.startup(function(use)
-- plugins ----------------------------------------------------------- plugins
-- dependencies / libraries
  use 'wbthomason/packer.nvim'
  use { 'miversen33/import.nvim' }
  use "miversen33/netman.nvim"
  use {
    'lewis6991/impatient.nvim',
    config = function()
      import"impatient"
    end
  }
-- dependencies / libraries


-- usability -------------------------------------------- usability
  use {
    "folke/which-key.nvim",
    config = function()
      import("plugins.which-key")
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
  -- or
  -- branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      import"plugins.nvim-ufo"
    end
  }

  use {
    'gelguy/wilder.nvim',
    requires = 'romgrk/fzy-lua-native',
    config = function()
      import"plugins.wilder"
    end,
  }
-- usability -------------------------------------------- usability

-- editting

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }, -- requires = {
    config = function()
      import"plugins.lsp_zero"
    end,
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      import"plugins.lspsaga"
    end,
    requires = {},
  })
-- editting

-- interface --------------------------------------------- interface
--   use {
--     'romgrk/barbar.nvim',
--     requires = {'kyazdani42/nvim-web-devicons'},
--     config = function()
--       import"plugins.barbar"
--     end,
--   }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use({
    "ktunprasert/gui-font-resize.nvim",
    config = function()
      import("plugins.gui-font-resize")
    end,
  })
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      import"plugins.neo-tree"
    end
  }

  use {
    'tamton-aquib/staline.nvim',
    config = function()
      import"plugins.staline"
    end,
  }

-- themes
  use {
    'B4mbus/oxocarbon-lua.nvim',
    config = function()
      vim.cmd 'colorscheme oxocarbon-lua'
    end
  }
-- themes


-- focus
--   use {
--     'camspiers/lens.vim',
--     requires = "camspiers/animate.vim"
--   }
-- focus


-- interface --------------------------------------------- interface


-- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      import"plugins.treesitter"
    end,
  }
-- treesitter


-- productivity
-- notes
  use {
    "nvim-neorg/neorg",
    config = function()
        import('plugins.neorg')
    end,
    requires = "nvim-lua/plenary.nvim",
    tag = "0.0.12"
  }
  use {
    'nvim-orgmode/orgmode',
    config = function()
      import('plugins.orgmode')
    end
  }
  use {
    'akinsho/org-bullets.nvim',
    config = function()
      import"plugins.org-bullets"
    end,
  }
-- notes
-- productivity


-- plugins ----------------------------------------------------------- plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    import('packer').sync()
  end
end)

