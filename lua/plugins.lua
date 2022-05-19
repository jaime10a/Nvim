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

  --Snippets vsnip
  use"hrsh7th/cmp-vsnip"
  use"hrsh7th/vim-vsnip"

  -- nvim-cmp
  use {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  }

  --AutoPairs
  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup{}

  --Comment.nvim
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  --Tree
  --TODO: make it quit on open. quit_on_open option doesnt work. It is being migrated to an option in lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
    require'nvim-tree'.setup {
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true
        },
    }
    end
  }

  --Theme (Nord)
  use 'shaunsingh/nord.nvim'

  --Theme Nightfox
  use 'EdenEast/nightfox.nvim'

  -- Theme OneNord
  use 'rmehri01/onenord.nvim'

  -- Theme Gruvbox
  use 'wittyjudge/gruvbox-material.nvim'
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

  --Bufferline Tabs
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    }
    require'bufferline'.setup {
        options = {
            diagnostics = "nvim_lsp",
            offsets = {{filetype = "NvimTree", text = "File Explorer"}},
        }
    }

    --Github Copilot
    use "github/copilot.vim"

end)
