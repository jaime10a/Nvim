--Nord Theme configuration
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true


--OneNord Config
require('onenord').setup({
  borders = true, -- Split window borders
  italics = {
    comments = true, -- Italic comments
    strings = false, -- Italic strings
    keywords = true, -- Italic keywords
    functions = false, -- Italic functions
    variables = false, -- Italic variables
  },
  disable = {
    background = true, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  custom_highlights = {}, -- Overwrite default highlight groups
})

--SetTheme
--require('onenord').setup()
--require('nord').set()
--require('gruvbox-material').setup()
--vim.cmd("colorscheme oxocarbon")
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.api.nvim_command "colorscheme catppuccin"

--LuaLine Config
require('lualine').setup {
  options = {
    theme = 'onenord',
    extensions = {'nvim-tree'}
  }
}


function ColorMyPencils()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = "dark"


    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#555555",
    })

    hl("CursorLineNR", {
        bg = "None"
    })

    hl("Normal", {
        bg = "none"
    })

    hl("LineNr", {
        fg = "#5eacd3"
    })

    hl("netrwDir", {
        fg = "#5eacd3"
    })

end
ColorMyPencils()
