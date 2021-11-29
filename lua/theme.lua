--Nord Theme configuration
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true

--Nightfox configuration
require('nightfox').setup{
	fox = "nordfox",
	transparent = true,
	alt_nc = true, --isnt useful with transparent true.
	terminal_colors = true,
	styles = {
		comments = "italic",
		keywords = "bold",
		functions = "italic,bold"
	},
  	inverse = {
    		visual = true, -- inverse the highlighting of match_parens
  	}
}

--SetTheme
require('nightfox').load()

--require('nord').set()

--LuaLine Config
require('lualine').setup {
  options = {
    theme = 'nightfox',
    section_separators = {'', ''},
    component_separators = {'', ''},
    extensions = {'nvim-tree'}
  }
}
