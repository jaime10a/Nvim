-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Expressive Mapping helper
local expressive_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { silent = true, expr = true })
end

-- Default Mapping helper
local plug_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = ' '

--  Toggle Numbers
mapper('n', '<leader>n', ':set rnu!<CR>')

-- use ESC to turn off search highlighting
mapper('n', '<Esc>', ':noh<CR>')

-- Resize with arrows
mapper('n', '<C-Up>', ':resize -2<CR>')
mapper('n', '<C-Down>', ':resize +2<CR>')
mapper('n', '<C-Left>', ':vertical resize -2<CR>')
mapper('n', '<C-Right>', ':vertical resize +2<CR>')

-- Plugins Mappings ↓

-- Telescope
mapper('n', '<C-F>', ':Telescope live_grep<CR>')
mapper('n', '<C-P>', ':Telescope find_files<CR>')

-- Tree
mapper('n', '<C-n>', ':NvimTreeToggle<CR>')

-- LazyGIT
mapper('n', '<Leader>gg', ':LazyGit<CR>')

--Hardcore Vim
mapper('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
mapper('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
mapper('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
mapper('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
