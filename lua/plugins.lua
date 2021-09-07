return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  --TODO
  use 'neovim/nvim-lspconfig'

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
  use 'neovim/nvim-lspconfig' --necessary to add other plugins

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
end)
