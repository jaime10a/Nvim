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
vim.g.maplocalleader = ","

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

--Quick Replace / Substitute
mapper('n', '<C-S>', ':%s/')

--Go to File
mapper('n', '<leader>gf', ':edit<cfile><CR>')

-- Plugins Mappings ↓

-- Telescope
mapper('n', ';g', ':Telescope live_grep<CR>')
mapper('n', ';f', ':Telescope find_files<CR>')
mapper('n', ';b', ':Telescope buffers<CR>')
mapper('n', ';s', ':Telescope git_status<CR>')
mapper('n', ';p', ':Telescope projects<CR>')
mapper('n', ';t', ':Telescope<CR>')
mapper('n', ';c', ':Telescope cheat fd<CR>')

-- Hop
mapper('n', '<leader>j', ':HopWord<CR>')

-- Tree
mapper('n', '<leader>t', ':NvimTreeToggle<CR>')

-- Neogit
mapper('n', '<leader>gg', ':Neogit<CR>')

-- Diffview
mapper('n', '<leader>gd', ':DiffviewOpen<CR>')
mapper('n', '<leader>gq', ':DiffviewClose<CR>')

--LSP
mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
mapper('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>')
mapper('n', 'ff', ':lua vim.lsp.buf.format()<CR>')

--Diagnostic
mapper('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>')

--CodeGPT (ChatGPT)
mapper('n', '<leader>c', ':Chat ')
mapper('v', '<leader>c', ':Chat ')

--Copilot
mapper('n', '<leader>pt', ':Copilot toggle<CR>')
mapper('n', '<leader>pp', ':Copilot panel<CR>')
