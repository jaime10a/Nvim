--SetTheme
--require('gruvbox-material').setup()
-- vim.api.nvim_command "colorscheme duskfox"
--
-- catppuccin
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.95,
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        hop = true,
        mason = true,
        neogit = true,
        -- For more (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

--LuaLine Config
require('lualine').setup {
    options = {
        theme = 'catppuccin',
        extensions = { 'nvim-tree' }
    }
}
