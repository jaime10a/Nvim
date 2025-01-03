-- Mapping helper
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Define Mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ","

-- Better scrolling (Not compatible with neoscroll)
-- mapper('n', '<C-u>', '<C-u>zz')
-- mapper('n', '<C-d>', '<C-d>zz')
-- mapper('n', ',', '<C-u>zz')
-- mapper('n', 'm', '<C-d>zz') -- Marks no longer available
mapper('n', ',', ':lua require("neoscroll").scroll(-vim.wo.scroll, true, 350)<CR>')
mapper('n', 'm', ':lua require("neoscroll").scroll(vim.wo.scroll, true, 350)<CR>')

--Center buffer on cursor while navigating
mapper('n', '{', '{zz')
mapper('n', '}', '}zz')
mapper('n', 'N', 'Nzz')
mapper('n', 'n', 'nzz')
mapper('n', '<C-i>', '<C-i>zz')
mapper('n', '<C-o>', '<C-o>zz')
mapper('n', '*', '*zz')
mapper('n', '#', '#zz')
mapper('n', ']m', ']mzz')
mapper('n', '[m', '[mzz')

-- Capital U to redo
mapper('n', 'U', '<C-r>')

--  Toggle Numbers
mapper('n', '<leader>n', ':set rnu!<CR>')

-- Lateral Movement
mapper('n', 'H', '^')
mapper('n', 'L', '$')

-- Comment and duplicate
mapper('v', 'gcp', 'y`>pgv:norm gcc<CR>`>j^')

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

-- Move lines in visual mode
mapper('v', 'J', ':m \'>+1<CR>gv=gv')
mapper('v', 'K', ':m \'<-2<CR>gv=gv')

--Quick Replace / Substitute
mapper('n', '<C-S>', ':%s/')

--Go to File
mapper('n', '<leader>gf', ':edit<cfile><CR>')

-- Plugins Mappings ↓

--Fzf-lua TODO: ; is used to repeat last search. also for [m (with treesitter-text-objects). Look for something else
mapper('n', ';f', ':lua require("fzf-lua").files()<CR>')
mapper('n', ';g', ':lua require("fzf-lua").live_grep()<CR>')
mapper('n', ';G', ':lua require("fzf-lua").live_grep_resume()<CR>')
mapper('n', ';b', ':lua require("fzf-lua").buffers()<CR>')
mapper('n', ';h', ':lua require("fzf-lua").help_tags()<CR>')
mapper('n', ';o', ':lua require("fzf-lua").oldfiles()<CR>')
mapper('n', ';q', ':lua require("fzf-lua").quickfix()<CR>')
mapper('n', ';l', ':lua require("fzf-lua").loclist()<CR>')
mapper('n', ';p', ':lua require("fzf-lua").complete_path()<CR>')
mapper('n', ';z', ':FzfLua ')

-- Use Tab to alternate between buffers <C-^>
mapper('n', '<Tab>', '<C-^>\'"zz ')

-- Hop
mapper('n', '<leader>j', ':HopWord<CR>')

-- Tree
mapper('n', '<leader>t', ':NvimTreeToggle<CR>')

-- Oil
mapper('n', '-', ':Oil<CR>')

-- Neogit
mapper('n', '<leader>gg', ':Neogit<CR>')

--LSP
mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
mapper('n', 'gd', ':lua require("fzf-lua").lsp_definitions()<CR>')
mapper('n', 'gD', ':lua require("fzf-lua").lsp_declarations()<CR>')
mapper('n', 'gi', ':lua require("fzf-lua").lsp_implementations()<CR>')
mapper('n', 'gr', ':lua require("fzf-lua").lsp_references()<CR>')
-- mapper('n', 'gr', ':TroubleToggle lsp_references<CR>')
mapper('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
mapper('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>')
mapper('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>')

-- Trouble.nvim / Diagnostics
mapper('n', '<leader>xx', ':Trouble workspace_diagnostics<CR>')
mapper('n', '<leader>xd', ':Trouble document_diagnostics<CR>')
mapper('n', '<leader>xt', ':Trouble todo<CR>')
mapper('n', '<leader>X', ':TroubleClose<CR>')

mapper('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>')
mapper('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>')
mapper('n', ']d', ':lua vim.diagnostic.goto_next()<CR>')

--Copilot
mapper('n', '<leader>pt', ':Copilot toggle<CR>')
mapper('n', '<leader>pd', ':Copilot disable<CR>')
mapper('n', '<leader>pp', ':Copilot panel<CR>')
mapper('n', '<leader>ps', ':lua require("copilot.suggestion").toggle_auto_trigger()<CR>')
