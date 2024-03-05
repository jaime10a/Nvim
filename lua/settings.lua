local o = vim.o  -- For the globals options :set
local w = vim.wo -- For the window local options
local b = vim.bo -- For the buffer local options
local g = vim.g -- For the buffer global options

--Side Numbers
o.relativenumber = true
o.number = true
o.numberwidth = 4

--Layout
o.showtabline = 1
-- o.colorcolumn = '100'

--Clipboard works with system
o.clipboard = "unnamedplus"

--Indentation
o.autoindent = true
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

--Lazyredraw
o.lazyredraw = true

--Split down with :split and right with :vsplit
o.splitbelow = true
o.splitright = true

--Wrapping off
o.wrap = false
--when wrapping next line starts at indent
o.breakindent = true

--Lines above and below the cursor
o.scrolloff = 10

--Mouse also works
o.mouse ='a'

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--Dont see -Insert
o.showmode = false

--Incremental Search
o.incsearch = true

--IgnorecAsE
o.ignorecase = true

--Search Highlight off
o.hlsearch = false

--Set undodir
o.undodir = "~/.vim/undodir"

--Get back to last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})
