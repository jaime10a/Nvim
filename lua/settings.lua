local o = vim.o  -- For the globals options :set
local w = vim.wo -- For the window local options
local b = vim.bo -- For the buffer local options
local g = vim.g -- For the buffer global options

--Side Numbers
o.relativenumber = true
o.number = true
o.numberwidth = 4

--Layout
o.showtabline = 2
o.colorcolumn = '80'

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
w.wrap = false

--Lines above and below the cursor
o.scrolloff = 10

--Mouse also works
o.mouse ='a'

vim.highlight.on_yank = true

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
