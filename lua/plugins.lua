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
                require 'nvim-treesitter.configs'.setup {
                    ensure_installed = "all",
                    highlight = {
                        enable = true, -- false will disable the whole extension
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
                require('telescope').setup { extensions = fzf }
                require('telescope').load_extension('fzf')
            end
        },

        --Hop
        {
            'phaazon/hop.nvim',
            name = 'hop',
            config = function()
                require 'hop'.setup { keys = 'asdfjklqweruiopvmc' }
            end
        },

        --Leap
        {
            'ggandor/leap.nvim',
            config = function()
                require('leap').set_default_keymaps()
            end
        },

        -- nvim-cmp
        {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
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

        -- SmartColumn
        {
            "m4xshen/smartcolumn.nvim",
            opts = {
                colorcolumn = "90",
                disabled_filetypes = {
                    "help", "text", "markdown", "mason", "lazy", "help", "NvimTree"
                },
                scope = "file",
            }
        },

        --Tree
        --TODO: make it quit on open.
        --Quit_on_open option doesnt work.
        --It is being migrated to an option in lua
        {
            'kyazdani42/nvim-tree.lua',
            dependencies = 'kyazdani42/nvim-web-devicons',
            config = function()
                require 'nvim-tree'.setup {
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
            dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
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

        --Neogit
        {
            'TimUntersberger/neogit',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'sindrets/diffview.nvim',
            },
            config = function()
                require('neogit').setup {
                    disable_commit_confirmation = true,
                    integrations = {
                        diffview = true
                    }
                }
            end
        },



        --Startify Alpha-vim
        {
            'goolord/alpha-nvim',
            dependencies = { 'kyazdani42/nvim-web-devicons' },
            config = function()
                require 'alpha'.setup(require 'alpha.themes.startify'.opts)
            end
        },

        --Github Copilot with lua
        {
            "zbirenbaum/copilot.lua",
            config = function()
                require('copilot').setup({
                    panel = {
                        auto_refresh = false,
                        keymap = {
                            jump_prev = "<C-p>",
                            jump_next = "<C-n>",
                            accept = "<CR>",
                            refresh = "<C-r>",
                            open = "<C-o>",
                        },
                        layout = {
                            position = "bottom",
                            ratio = 0.3,
                        }
                    },
                    suggestion = {
                        enabled = true,
                        auto_trigger = true,
                        debounce = 75,
                        keymap = {
                            accept = "<C-y>",
                            accept_word = false,
                            accept_line = false,
                            next = "<C-i>",
                            prev = false,
                            dismiss = false,
                        }
                    }
                })
            end
        },

        --Latex Support
        'lervag/vimtex',

        --Whichkey
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
            { "dpayne/CodeGPT.nvim", dev = false },
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
        },
        {
            "folke/trouble.nvim",
        },
        --Neoscroll
        {
            'karb94/neoscroll.nvim',
            config = function()
                require('neoscroll').setup({
                    hide_cursor = false,          -- Hide cursor while scrolling
                    easing_function = "quadratic",       -- Default easing function
                })
            end
        },

        { -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            dependencies = {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                { 'j-hui/fidget.nvim', opts = {} }, --notifications
            },
            config = function()
                vim.api.nvim_create_autocmd('LspAttach', {
                    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                    callback = function(event)
                        -- When you move your cursor, the highlights will be cleared (the second autocommand).
                        local client = vim.lsp.get_client_by_id(event.data.client_id)
                        if client and client.server_capabilities.documentHighlightProvider then
                            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                                buffer = event.buf,
                                callback = vim.lsp.buf.document_highlight,
                            })

                            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                                buffer = event.buf,
                                callback = vim.lsp.buf.clear_references,
                            })
                        end
                    end,
                })

                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

                local servers = {
                    clangd = {},
                    gopls = {},
                    pyright = {},
                    rust_analyzer = {},
                    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                    lua_ls = {
                        -- cmd = {...},
                        -- filetypes { ...},
                        -- capabilities = {},
                        settings = {
                            Lua = {
                                runtime = { version = 'LuaJIT' },
                                workspace = {
                                    checkThirdParty = false,
                                    -- Tells lua_ls where to find all the Lua files that you have loaded
                                    -- for your neovim configuration.
                                    library = {
                                        '${3rd}/luv/library',
                                        unpack(vim.api.nvim_get_runtime_file('', true)),
                                    },
                                    -- If lua_ls is really slow on your computer, you can try this instead:
                                    -- library = { vim.env.VIMRUNTIME },
                                },
                                completion = {
                                    callSnippet = 'Replace',
                                },
                            },
                        },
                    },
                }

                require('mason').setup()

                local ensure_installed = vim.tbl_keys(servers or {})
                vim.list_extend(ensure_installed, {
                    'stylua', -- Used to format lua code
                })
                require('mason-tool-installer').setup { ensure_installed = ensure_installed }

                require('mason-lspconfig').setup {
                    handlers = {
                        function(server_name)
                            local server = servers[server_name] or {}
                            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities,
                                server.capabilities or {})
                            require('lspconfig')[server_name].setup(server)
                        end,
                    },
                }
            end,
        },


    },

    --Options for Lazyvim
    {
        dev = {
            path = "~/projects/nvim",
            fallback = false, -- Fallback to git when local plugin doesn't exist
        },


    })
