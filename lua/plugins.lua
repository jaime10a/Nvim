-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup(
--Plugins
{

  --Treesitter
  {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = 'romgrk/nvim-treesitter-context',
  config = function()
      require'nvim-treesitter.configs'.setup {
      -- TODO Uncommented because of errors should un-uncomment and try again
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      highlight = {
        enable = true,              -- false will disable the whole extension
        },
      }
  end
  },

  --Telescope
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  config = function()
    require('telescope').setup{extensions = fzf }
    require('telescope').load_extension('fzf')
  end
  },

  --Hop
  {
    'phaazon/hop.nvim', name = 'hop',
    config = function()
    require'hop'.setup { keys = 'asdfjklqweruiopvmc' }
    end
  },

  --Leap
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
    },

  --LSP (lsps are started in lsp.lua)
  'neovim/nvim-lspconfig', --necessary to add language servers
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require("mason-lspconfig").setup()
      end
  },


  --Snippets vsnip
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",

  -- nvim-cmp
  {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  },

  --AutoPairs
  'windwp/nvim-autopairs',
  -- require('nvim-autopairs').setup{}

  --Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },

  --Tree
  --TODO: make it quit on open. quit_on_open option doesnt work. It is being migrated to an option in lua
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
    require'nvim-tree'.setup {
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true
        },
    }
    end
  },

  --Theme Nightfox
  'EdenEast/nightfox.nvim',

  -- Theme Gruvbox
  'wittyjudge/gruvbox-material.nvim',

  {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup()
	end
  },

  --LuaLine
  {
    'hoob3rt/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', lazy = true}
  },

  --GitSigns
  {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
    },
  config = function()
    require('gitsigns').setup()
  end
  },

  --LazyGit
  'kdheepak/lazygit.nvim',

  --Startify Alpha-vim
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  },

    --Github Copilot
    "github/copilot.vim",

    --Mason package manager
    { "williamboman/mason.nvim" },
    -- require('mason').setup()

    --Latex Support
    'lervag/vimtex',

    --Whichkey
    -- Lua
    {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {

        }
      end
    },

    --CodeGPT
    {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {"dpayne/CodeGPT.nvim", dev = false},
    },

    --ChatGPT.nvim
    {
        'jackMort/ChatGPT.nvim',

        config = function()
            require('chatgpt').setup({})
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
  }

},

--Options for Lazyvim
{    dev = {
    path = "~/projects/nvim",
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },

})
