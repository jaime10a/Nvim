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
require('gruvbox-material').setup()

--LuaLine Config
require('lualine').setup {
  options = {
    theme = 'onenord',
    extensions = {'nvim-tree'}
  }
}
