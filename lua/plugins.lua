return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --Treesitter
  use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = 'romgrk/nvim-treesitter-context'
  }

  --Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  --Hop
  use {
  'phaazon/hop.nvim', as = 'hop',
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'asdfjklqweruiopvmc' }
  end
  }

  --LSP
  use 'neovim/nvim-lspconfig' --necessary to add language servers

  -- nvim-cmp, and buffer source as a dependency
  use {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
     }
  }

  --Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  --Theme (Nord)
  use 'shaunsingh/nord.nvim'

  --LuaLine
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  --GitSigns
  use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
    },
  config = function()
    require('gitsigns').setup()
  end
  }

  --LazyGit
  use 'kdheepak/lazygit.nvim'

end)
