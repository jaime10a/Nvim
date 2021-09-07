--Use Nord Theme
require('nord').set()
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true

--LuaLine Config
require('lualine').setup {
  options = {
    theme = 'nord',
    section_separators = {'', ''},
    component_separators = {'', ''},
    extensions = {'nvim-tree'}
  }
}
