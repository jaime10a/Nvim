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
            config = function()
                ---@diagnostic disable-next-line: missing-fields
                require('nvim-treesitter.configs').setup {
                    ensure_installed = {
                        'bash', 'c', 'html', 'lua', 'markdown',
                        'vim', 'vimdoc', 'rust', 'go', 'javascript'
                    },
                    -- Autoinstall languages that are not installed
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },

                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            node_incremental = "v",
                            node_decremental = "V",
                        }
                    },

                    textobjects = {
                        select = {
                            enable = true,
                            lookahead = true,
                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",
                            },
                        },
                        swap = {
                            enable = true,
                            swap_next = {
                                ["<leader>a"] = "@parameter.inner",
                            },
                            swap_previous = {
                                ["<leader>A"] = "@parameter.inner",
                            },
                        },
                    },
                }
            end,
        },
        --Textobjects
        "nvim-treesitter/nvim-treesitter-textobjects",

        --Fzf-lua
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
            -- or if using mini.icons/mini.nvim
            -- dependencies = { "echasnovski/mini.icons" },
            opts = {}
        },

        --Hop
        {
            "phaazon/hop.nvim",
            name = "hop",
            config = function()
                require("hop").setup({ keys = "asdfjklqweruiopvmc" })
            end,
        },

        --AutoPairs
        "windwp/nvim-autopairs",
        -- require('nvim-autopairs').setup{}

        --Comment.nvim
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        },

        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                auto_close = true,
            },
        },

        -- Highlight todo, notes, etc in comments
        {
            'folke/todo-comments.nvim',
            event = 'VimEnter',
            dependencies = { 'nvim-lua/plenary.nvim' },
            opts = { signs = false }
        },

        { -- Collection of various small independent plugins/modules
            'echasnovski/mini.nvim',
            config = function()
                -- Better Around/Inside textobjects
                --
                -- Examples:
                --  - va)  - [V]isually select [A]round [)]paren
                --  - yinq - [Y]ank [I]nside [N]ext [']quote
                --  - ci'  - [C]hange [I]nside [']quote
                require('mini.ai').setup { n_lines = 500 }

                -- Add/delete/replace surroundings (brackets, quotes, etc.)
                --
                -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
                -- - sd'   - [S]urround [D]elete [']quotes
                -- - sr)'  - [S]urround [R]eplace [)] [']
                require('mini.surround').setup()
            end,
        },


        -- SmartColumn
        {
            "m4xshen/smartcolumn.nvim",
            opts = {
                colorcolumn = "90",
                disabled_filetypes = {
                    "help",
                    "text",
                    "markdown",
                    "mason",
                    "lazy",
                    "help",
                    "NvimTree",
                },
                scope = "file",
            },
        },

        --Tree
        {
            "kyazdani42/nvim-tree.lua",
            dependencies = "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-tree").setup({
                    update_cwd = true,
                    update_focused_file = {
                        enable = true,
                        update_cwd = true,
                    },
                    actions = {
                        open_file = {
                            quit_on_open = true,
                        },
                    }
                })
            end,
        },

        --Oil.nvim
        {
            'stevearc/oil.nvim',
            opts = {
                default_file_explorer = true,
            },
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        --Theme Nightfox
        "EdenEast/nightfox.nvim",

        -- Theme Gruvbox
        "wittyjudge/gruvbox-material.nvim",

        {
            "catppuccin/nvim",
            name = "catppuccin",
            config = function()
                require("catppuccin").setup()
            end,
        },

        --LuaLine
        {
            "hoob3rt/lualine.nvim",
            dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
        },

        --GitSigns
        {
            "lewis6991/gitsigns.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("gitsigns").setup()
            end,
        },

        --LazyGit
        "kdheepak/lazygit.nvim",

        --Neogit
        {
            "TimUntersberger/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
            },
            config = function()
                require("neogit").setup({
                    disable_commit_confirmation = true,
                    integrations = {
                        diffview = true,
                    },
                })
            end,
        },

        --Startify Alpha-vim
        {
            "goolord/alpha-nvim",
            dependencies = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("alpha").setup(require("alpha.themes.startify").opts)
            end,
        },

        --TODO: https://github.com/CopilotC-Nvim/CopilotChat.nvim
        --Github Copilot with lua
        {
            "zbirenbaum/copilot.lua",
            config = function()
                require("copilot").setup({
                    panel = {
                        enabled = true,
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
                        },
                    },
                    suggestion = {
                        enabled = true,
                        auto_trigger = true,
                        debounce = 75,
                        keymap = {
                            accept = "<C-f>",
                            accept_word = false,
                            accept_line = false,
                            next = "<C-g>",
                            prev = false,
                            dismiss = false,
                        },
                    },
                })
            end,
        },

        --Latex Support
        "lervag/vimtex",

        --Whichkey
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 500
            end,
            opts = {
            }
        },

        --Trouble
        {
            "folke/trouble.nvim",
        },
        --Neoscroll
        {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup({
                    hide_cursor = false,           -- Hide cursor while scrolling
                    easing_function = "quadratic", -- Default easing function
                })
            end,
        },

        -- TODO: doesnt work
        --
        -- Use this mapper
        -- mapper('n', '<leader>f', ':lua require("conform").format()<CR>')
        --
        -- --Formatting
        -- 'stevearc/conform.nvim',
        -- opts = {
        --     notify_on_error = true,
        --     format_on_save = {
        --             timeout_ms   = 300,
        --         lsp_fallback = true,
        --     },
        --     formatters_by_ft = {
        --         lua = { 'stylua' },
        --         -- Conform can also run multiple formatters sequentially
        --         python = {  "black" },
        --         go = { "gofmt", "goimports" },
        --     },
        -- },

        --Avante (in separate file)
        require("avante"),

        --LSP config (in separate file)
        require("lsp"),

        -- nvim-cmp Completion (in separate file)
        require("completion"),
    },

    --Options for Lazyvim
    {
        dev = {
            path = "~/projects/nvim",
            fallback = false, -- Fallback to git when local plugin doesn't exist
        },
    }
)
