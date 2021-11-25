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

--Quit all Windows saving
mapper('n', '<leader>q', ':wqa<CR>')

--Save
mapper('n', '<leader>w', ':w<CR>')

-- Switch Windows with arrows
mapper('n', '<Up>', ':wincmd k<CR>')
mapper('n', '<Down>', ':wincmd j<CR>')
mapper('n', '<Left>', ':wincmd h<CR>')
mapper('n', '<Right>', ':wincmd l<CR>')

-- Resize Windows with arrows + Control
mapper('n', '<C-Up>', ':resize -2<CR>')
mapper('n', '<C-Down>', ':resize +2<CR>')
mapper('n', '<C-Left>', ':vertical resize -2<CR>')
mapper('n', '<C-Right>', ':vertical resize +2<CR>')

--Go to File
mapper('n', '<leader>gf', ':edit<cfile><CR>')

-- Plugins Mappings ↓

-- Telescope
mapper('n', '<leader>fg', ':Telescope live_grep<CR>')
mapper('n', '<leader>ff', ':Telescope find_files<CR>')

-- Hop
mapper('n', '<leader>j', ':HopWord<CR>')

-- Tree
mapper('n', 't', ':NvimTreeToggle<CR>')

-- LazyGIT
mapper('n', '<leader>gg', ':LazyGit<CR>')

--LSPSaga
mapper('n', '<leader>sh', ':Lspsaga hover_doc<CR>')
