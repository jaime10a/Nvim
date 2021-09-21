return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --Treesitter
  use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = 'romgrk/nvim-treesitter-context'
  }

  require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    },
  }

  --Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  require('telescope').setup{extensions = fzf}
  require('telescope').load_extension('fzf')

  --Hop
  use {
  'phaazon/hop.nvim', as = 'hop',
  config = function()
  require'hop'.setup { keys = 'asdfjklqweruiopvmc' }
  end
  }

  --LSP (lsps are started in lsp.lua)
  use 'neovim/nvim-lspconfig' --necessary to add language servers
  use 'glepnir/lspsaga.nvim'
  require('lspsaga').init_lsp_saga()

  -- nvim-cmp, and buffer source as a dependency
  use {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
     }
  }

  --AutoPairs
  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup{}
  require("nvim-autopairs.completion.cmp").setup({
  	map_cr = true, --  map <CR> on insert mode
   	map_complete = true, -- it will auto insert `(` after select function or method item
   	auto_select = true -- automatically select the first item
  })

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

  --Startify Alpha-vim
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
}

end)
